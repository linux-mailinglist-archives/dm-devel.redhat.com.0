Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7F61FF69E
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 17:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592494092;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EZmuYCRoAcZYqJFooITitJVJ0QjCEvc1/+QSODDzT2I=;
	b=hifc1+nD8acUN57hFf1o90VwDwRQsjrDmtjH+vaBtA1HEF2Oei6l6WVnaTUNbaMuYjZGS7
	FEa4nm/fZRcD7KL5n/Tv6dWTU9CGIgPlwAFvtFSiZk3dmslabQYrkZoaGWO9EARmg4SQMt
	n2LA+IgKnbP2OoduMe0iCKW+fRJtqas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-w2gAGhDpM4KzH2l12twqKQ-1; Thu, 18 Jun 2020 11:28:10 -0400
X-MC-Unique: w2gAGhDpM4KzH2l12twqKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B4EA872FE4;
	Thu, 18 Jun 2020 15:28:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D3F5D9E5;
	Thu, 18 Jun 2020 15:27:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4FBD1809547;
	Thu, 18 Jun 2020 15:27:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IFRW4F021591 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 11:27:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8A8E2202696B; Thu, 18 Jun 2020 15:27:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 850D02028CD2
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 15:27:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 805E1833B49
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 15:27:29 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05on2083.outbound.protection.outlook.com [40.107.21.83])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-406-rCZoIFxBMkq0C0rVXefG8w-1; Thu, 18 Jun 2020 11:27:26 -0400
X-MC-Unique: rCZoIFxBMkq0C0rVXefG8w-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6633.eurprd04.prod.outlook.com (2603:10a6:10:109::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Thu, 18 Jun 2020 15:27:22 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 15:27:22 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 1/7] libmultipath: change do_get_info returns
Thread-Index: AQHWRQbbV1Fx0AEcik20ZzTqm3vuLqjef92A
Date: Thu, 18 Jun 2020 15:27:22 +0000
Message-ID: <a0ac8df28c485019977a5baa3d1c4620604952db.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-2-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c65b6563-1131-4655-f81b-08d8139c18e1
x-ms-traffictypediagnostic: DB8PR04MB6633:
x-microsoft-antispam-prvs: <DB8PR04MB66331531685FAF02D6BEBA59FC9B0@DB8PR04MB6633.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3iuAhVtjjPHyzgpLZxtKP/nZ/9U0QcYjiTIcSFB61vJhe/7394X6NCJeSOrchDrVwbhPDHXKZWypJVDmK9hFaUJC67cgnaTCotuMv62xXMkKx/ASzgyCJPcCzY0Loc4rbGsNb+Vdu1oIe2xVwSjkB0lFFSWp+K15rEtI5xpjs7hl28SgfsOAkVgJzm+JTrKA7/im+QOnFIklXxhwIflBkiDYBHe9/f6ZKiyWzIe3A1T0+ojTBo9b3uCkgBUgtJqziNDv4Vgcjiemx1YcdtrJKj3tivcefrYwYErJs2A3ZR1Qy7XaFmk2yJVaeLgXdJFFZVo/RrSicLNh/StVPU0kzQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(136003)(346002)(366004)(396003)(39860400002)(376002)(8676002)(110136005)(6486002)(36756003)(5660300002)(2906002)(478600001)(6512007)(71200400001)(8936002)(4326008)(83380400001)(316002)(2616005)(66946007)(66476007)(66556008)(64756008)(66446008)(76116006)(91956017)(26005)(186003)(6506007)(86362001)(66574015);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: gtGpasIYRgIkXhFonUvUyFO4oUOaHjeXOgyTnMgixNl845u+FLhFIoNh4ew8C5O0Q6K1nU/doTOdHbMpzIfBTIwA0mJSf7y7QSOmPBqwZ05pxRqAFYVqDZ7EtwHEWaGlVqUTkOE3O+WiqOz/4brKyLVG5Ai68ORH01i+Rsdxiq0omNA/aV6qCDSBGAetUNVSt70MO49VhluZQHygovu1jnrMmaXeWFYJCuXfEHttpP3/ghtWs0yWng7LgHyybgn50Swy6ypho4LT60dH+DkA+ZujDNOZmE/nCR/nN6gIS5YCHNd1yYpr+xDq4w+CYN6jOlGwIGTuG+QA0MFCPtqZ5xbKc9yeNQ8ujkQHvw1VBJff7YD0Fmd68NJQ/dAUWtCdLfjifCgffXO0sDxzcCMjdCzynV74o2D9MBqFkTVoSkijbxhh0uC1lOJiyM6ks5XrQRVlM423kknuZdPa5tZji5x4j17bMhgstEIACsDE7Hc=
x-ms-exchange-transport-forked: True
Content-ID: <FB37BA5D656FC442863BE95B829AB205@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65b6563-1131-4655-f81b-08d8139c18e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 15:27:22.4394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nv+uOiiGDyRE1KKI9ZTbZk4yZwkkETjyR27k1D/SwYP8RpGkUSkiHrwXOrQGqI3P7mWk1YoMgu5f4DbDNY9ZmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6633
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IFRW4F021591
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/7] libmultipath: change do_get_info returns
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-06-17 at 19:24 -0500, Benjamin Marzinski wrote:
> Make do_get_info() differentiate between dm failures and missing
> devices, and update callers to retain their current behavior. Also,
> rename it and make it external. These changes will be used by future
> commits.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/devmapper.c | 29 ++++++++++++++++-------------
>  libmultipath/devmapper.h |  1 +
>  2 files changed, 17 insertions(+), 13 deletions(-)
>=20
> diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
> index 27d52398..b44f7545 100644
> --- a/libmultipath/devmapper.c
> +++ b/libmultipath/devmapper.c
> @@ -496,8 +496,14 @@ int dm_addmap_reload(struct multipath *mpp, char
> *params, int flush)
>  =09return 0;
>  }
> =20
> -static int
> -do_get_info(const char *name, struct dm_info *info)
> +/*
> + * Returns:
> + * -1: Error
> + *  0: device does not exist
> + *  1: device exists
> + */

Can we use symbolic values here please? In particular as you have
changed the "success" return value from 0 to 1...

One day we should come up with a proper return value scheme
for libmultipath, defining specific enums for every function
doesn't scale. But do it here for now nonetheless, please.

Apart from that, ok.

Regards
Martin

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

