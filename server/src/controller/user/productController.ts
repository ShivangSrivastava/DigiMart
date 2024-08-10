import express from 'express';
import ProductModel from '../../model/product/productModel';

export const userGetAllCategoryController = (_req: express.Request, res: express.Response) => {
    ProductModel.distinct("category")
      .then((categories) => {
        res.status(200).json(categories);
      })
      .catch((err) => {
        res.status(500).json(err);
      });
  }; export const userProductOnCategoryController = (req: express.Request, res: express.Response) => {
    ProductModel.find({ category: req.params.category })
      .then((products) => {
        res.status(200).json(products);
      })
      .catch((err) => {
        res.status(500).json(err);
      });
  };export const userSearchController = (req: express.Request, res: express.Response) => {
    ProductModel.find({
      $text: {
        $search: req.params.q,
        $caseSensitive: false,
        $diacriticSensitive: false,
      },
    })
      .then((products) => {
        res.status(200).json(products);
      })
      .catch((err) => {
        res.status(500).json(err);
      });
  };