Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id BAD241FFC84
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 22:30:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592512229;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qF6PD6XljgWQPRkZDpT/xGIPTzIa7obyeIZhvl7s0PA=;
	b=dBdtcG5Ay3UpfgNsykAJMH+uLXRBt56j0deWHKwWdmHvP+kaL/zkLxyrIkXO4Jz0H+gEVi
	FEiYPR5WMR66oX3x3dIwzExyl2oDrPn6TUKEXsv8IWHzFEa7UA6nk0gvDE524lKrLeZYfm
	jrOp4XJPLax/pqzclE4Eunrxly+Pc+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-Zy6B2FrjOTOONRscxfPYrg-1; Thu, 18 Jun 2020 16:30:26 -0400
X-MC-Unique: Zy6B2FrjOTOONRscxfPYrg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E1AD1937FF1;
	Thu, 18 Jun 2020 20:30:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3631F5DEBA;
	Thu, 18 Jun 2020 20:30:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CAD9833BD;
	Thu, 18 Jun 2020 20:30:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IKU0DT028296 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 16:30:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F23E10590CA; Thu, 18 Jun 2020 20:30:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2958010590CB
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:29:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32AA3833B47
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 20:29:58 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-315-wvsjis0jPQKgKkVafBTFGw-1; Thu, 18 Jun 2020 16:29:55 -0400
X-MC-Unique: wvsjis0jPQKgKkVafBTFGw-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB8PR04MB6908.eurprd04.prod.outlook.com (2603:10a6:10:116::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22;
	Thu, 18 Jun 2020 20:29:54 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::d0dd:40e:5a9d:976e%4]) with mapi id 15.20.3109.021;
	Thu, 18 Jun 2020 20:29:54 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 3/7] libmultipath: make dm_flush_maps only return 0 on
	success
Thread-Index: AQHWRQbiDwIp6C+yuEmPY+ao8Dg7Jqje1GSA
Date: Thu, 18 Jun 2020 20:29:54 +0000
Message-ID: <8d3690e3ce8e01a15663502ddcd2c99095b9ee72.camel@suse.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
	<1592439867-18427-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-4-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [88.73.133.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8205b521-d60e-4947-774a-08d813c65c1a
x-ms-traffictypediagnostic: DB8PR04MB6908:
x-microsoft-antispam-prvs: <DB8PR04MB69084FCE1E8E41FFBD506493FC9B0@DB8PR04MB6908.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0438F90F17
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xIitJlfJ3Vq1Bi+EWyaN4H1aDjvQdO5GMqQrAA3HhyOhb2qlf9IRymIjmidEPqcVQUGrBVKY/s/5chGvm9owiNzu7+uN5oB6cDPdZ7tcqmmSTqcq0PNks7+/hgucx1RS2SQhI3Ugc2uLRB2LUelCv3vgSlWpFO6tk7tItmFwIt8WSf5InZ4R5fHAHEo6YAMDRAKU39Ep/AzcRTLLrNkAFQwOmea1emWN/+8j/OcZhHPh9S6jwmGmbMqge5qG7yqW9QvirI1FNIJSkACiq47b3sqgRAbYfjAZP2uU0lABI9Kk5OlPxWK4cKUQgUQazaiCQ8fMg44cD1xa0FDpG4omYw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(346002)(366004)(376002)(396003)(39860400002)(136003)(76116006)(66446008)(91956017)(66556008)(66946007)(66476007)(36756003)(110136005)(508600001)(6512007)(316002)(2616005)(6486002)(64756008)(4326008)(6506007)(86362001)(5660300002)(8936002)(186003)(2906002)(71200400001)(4744005)(83380400001)(8676002)(26005);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: SoHjhiE1iYlBl1+rlIpU0v40MkBp7cHq8TQfBXrqyuRMOleD5WB39kInsO3xdyG+hPSgs3lS4a9JhAjR3ArRESMZ4M0UeFnzHABMqTKFOBSu/fJTxTPOgz953chTiL+2BMEnjzo5xQX37nJASp9iMGkLlFTYUkH+vnfm3ajPRsJXnyUzeZZcAbCq8t750yLD2ZlH3THjkNBI39wiqee2c/JM7YTKtCvv2GPzFjkL3MXdjYl1oXd8C89VpbGN5QXB+rB+GgFODGk/bfm3/SmAyL+i/Xhya7IMNNYhnl7mE6iG+IWseoZbyBpxLr51xnW6XL2an0O+vBtJQZ+mL+pvOlyi751jL/ELJ4mm82JiXT0r0pzNPJlh68mXRSwnq4vJp/VRtF9qrXu+cmNZpDX7QrOD0XAOuEX43oM2AmPW2eIG+tFgMXttHPd9wFr7JZ3gCQXz5mJLvDBdHLLwCy32LfFKwm/7e69Tm+eShOAIh6k=
x-ms-exchange-transport-forked: True
Content-ID: <6FC6C2779DC5AA4CA76BAEFDDBE49A76@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8205b521-d60e-4947-774a-08d813c65c1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2020 20:29:54.1466 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RAET8zHUMtZwHgT3EtkNK5ZJuUtgLfXiUfTip5cyIZ9CsAZKTjJib2N9rkgBh9BHZWKCUBspHxnARub+KxDxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6908
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05IKU0DT028296
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/7] libmultipath: make dm_flush_maps only
 return 0 on success
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
> dm_flush_maps() returned both 0 and 1 on error, depending on which
> part
> of the function it was in, but the caller was always treating 0 as a
> success. Make dm_flush_maps() always return 1 on error and 0 on
> success.
>=20
> Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> ---
>  libmultipath/devmapper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20

Reviewed-by: Martin Wilck <mwilck@suse.com>

--=20
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE  Software Solutions Germany GmbH
HRB 36809, AG N=FCrnberg GF: Felix
Imend=F6rffer



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

