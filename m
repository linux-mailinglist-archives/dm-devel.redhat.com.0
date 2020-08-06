Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 44DEA23D969
	for <lists+dm-devel@lfdr.de>; Thu,  6 Aug 2020 12:49:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-w2dYpTKIMkWJc1w2cNgANg-1; Thu, 06 Aug 2020 06:49:21 -0400
X-MC-Unique: w2dYpTKIMkWJc1w2cNgANg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 693B9100A8E7;
	Thu,  6 Aug 2020 10:49:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 678E81A922;
	Thu,  6 Aug 2020 10:49:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08FA996939;
	Thu,  6 Aug 2020 10:49:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076AmK9B031984 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 06:48:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E9C72F51BF; Thu,  6 Aug 2020 10:48:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2449F5564
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 10:48:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F2B2800143
	for <dm-devel@redhat.com>; Thu,  6 Aug 2020 10:48:17 +0000 (UTC)
Received: from de-smtp-delivery-102.mimecast.com
	(de-smtp-delivery-102.mimecast.com [62.140.7.102]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-183--yblAhc7OvS1v-oCD9cfyQ-1;
	Thu, 06 Aug 2020 06:48:15 -0400
X-MC-Unique: -yblAhc7OvS1v-oCD9cfyQ-1
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
	(mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
	(Using TLS) by relay.mimecast.com with ESMTP id
	de-mta-20-WSIhF-mhPoiVpBxeow5QSA-1; Thu, 06 Aug 2020 12:48:13 +0200
X-MC-Unique: WSIhF-mhPoiVpBxeow5QSA-1
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com (2603:10a6:10:103::20)
	by DB6PR04MB3000.eurprd04.prod.outlook.com (2603:10a6:6:b::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.3261.16; Thu, 6 Aug 2020 10:48:12 +0000
Received: from DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593]) by DB8PR04MB6555.eurprd04.prod.outlook.com
	([fe80::8130:53b2:48d5:593%3]) with mapi id 15.20.3261.019;
	Thu, 6 Aug 2020 10:48:12 +0000
From: Martin Wilck <Martin.Wilck@suse.com>
To: "bmarzins@redhat.com" <bmarzins@redhat.com>,
	"christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Thread-Topic: [PATCH 3/6] libmultipath: remove code duplication in path
	counting
Thread-Index: AQHWZEuVvJFlzTpo+kS3jqpBpvViUakq9ZCA
Date: Thu, 6 Aug 2020 10:48:12 +0000
Message-ID: <a8190af67d89edb0819b231417b349e56c3deff1.camel@suse.com>
References: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
	<1595877868-5595-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1595877868-5595-4-git-send-email-bmarzins@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.4
x-originating-ip: [90.186.231.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab7bf94f-b18e-4b2a-fef5-08d839f63761
x-ms-traffictypediagnostic: DB6PR04MB3000:
x-microsoft-antispam-prvs: <DB6PR04MB3000E5B7AC45DF3510B6B754FC480@DB6PR04MB3000.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Chj72fYMzOE4fh7IcHIXuiK8WpPY+80VoK2Ec6gkDhk5nWccLnb9CZcBSwuF9shGWFDZLlEt18W7Odi46U04oYFvAMzLxZ39ksZq1iWjFGPrWE3JgPGkmlMT6JxtLMzNEqg/a83pWoRR7BTxymWGRUWTrh78mtSyBysDtrSjQwksrKWzufPugxvaGkvFB7UMtDFANB8MMPG8WWC4bNyBiz9QjVRUIR3toZbOYN8SH0dV4L/fuFnH6hTvQOwUNhhytNjMMX5Qq5VCVFXUKhVtH24dtOj9ZlCvwfYb3njSY/5pnFyDp0nLEg587Sls+Q7/KEqLlcfcqf/ro8BM8bCH8g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:DB8PR04MB6555.eurprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(39860400002)(376002)(136003)(396003)(346002)(366004)(71200400001)(26005)(66946007)(91956017)(66476007)(8676002)(6506007)(66556008)(66446008)(76116006)(186003)(64756008)(5660300002)(8936002)(478600001)(4326008)(316002)(2616005)(6486002)(86362001)(36756003)(2906002)(6512007)(110136005);
	DIR:OUT; SFP:1101;
x-ms-exchange-antispam-messagedata: kbMREDn1J7H/BZej/0ET3npdv3+M9BAM6zY6jpZ8jRdZ1FqJN9GwHk4xtsZUQdKa1J5QSP/xRqVhWqWmBVvQXjUNfceZ7bCb/LutKK17ANO3gRqHpYhGz45dWSaPbOZ/KKpAIoBNer9g+QYgudqeR/YvJio/cYCV4WOJdp2THNeBOIGk2G6aEhVJiK+2vOlrn7ERIVusYmYk41OXURucK3R9C4gEVeqd+1jfxddo1ngFPHDoEJF+dZFP1JlRD+Jx8Foeeqa0oeGvfFmn6yK+KArR3kVEFKS2bLm+BECNQqHzdmKrnHau9fgCK7/KAP/dbM5hCF6aztI3Y9voTKGEjEc07vVL3Ic3MvLWsN2UA7smATUyiA1ms5FgZX3hb4dyYX9kYcbF/cB4sfElecWHNNYbYYjb54v0GI4F4slMBAJXNJKRB4CxNnEJOpKhMF7yLMsnELSccrK/RoH2ydG/2neqKHc2q6293nEbANu6XWL/4KT4Zs8ez93JCGvbRUr3CJeMH6fxSl30iyMNrp9pMOZT19W4v/2ts/NsVaYCS8x6wyjQts7HOP9knNyDlar0M0/fPC4dkJE+Ekoso/+eG85RcidfL6wV115fhuKQDbgher2mu7V+GU9OV3WaI/6bCfQFs/3CZTDpyFr56XIK4w==
x-ms-exchange-transport-forked: True
Content-ID: <ECE4D8CCF58B2042902527C39C71B5C3@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6555.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab7bf94f-b18e-4b2a-fef5-08d839f63761
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2020 10:48:12.6292 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRwjck3G46wQNZVY9007t6Z95oBHV7NMCyQA2dPEwIq6Jw8W2J8rZxFGa5xPD1yPY9SdRzcqn1UF9gjrU/ty2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3000
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 076AmK9B031984
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/6] libmultipath: remove code duplication in
 path counting
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-07-27 at 14:24 -0500, Benjamin Marzinski wrote:
> pathcountgr() is never used except by pathcount(), and neither is the
> special case for PATH_WILD. Simplify this and make one function that
> is
> used by both pathcount() and count_active_paths(). This will be used
> again in a future patch.
> 
> Also use count_active_paths() in mpath_persist.

The patch looks correct. I had thought about something like it as well
when I first introduced count_active_paths(). But count_active_paths()
is used a *lot*, and often in critical situations. I wonder whether it
deserves an optimized version. The compiler can surely optimize better
with two constant expressions than with the additional for-loop over an
array with variable size. That's why back then I decided against
implementing it as a special case of a generic function. I actually
considered inlining count_active_paths().

It's hard to quantify the effect, and I haven't done any benchmarks. 
But still, can we perhaps keep the optimized version of
count_active_paths() itself?

Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

