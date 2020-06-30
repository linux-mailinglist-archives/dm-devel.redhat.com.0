Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 29E1C20EC26
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 05:46:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-fe4uokizMEKHUXhG3D5KdA-1; Mon, 29 Jun 2020 23:46:30 -0400
X-MC-Unique: fe4uokizMEKHUXhG3D5KdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4D8C107ACCA;
	Tue, 30 Jun 2020 03:46:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5733160BEC;
	Tue, 30 Jun 2020 03:46:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9111C1809547;
	Tue, 30 Jun 2020 03:46:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U3k1uD016782 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 23:46:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A11F2026E04; Tue, 30 Jun 2020 03:46:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 281E52029F78
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 03:45:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22429924901
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 03:45:59 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-168-kGc8j8BhOtSbvcDvcX2_YQ-1; Mon, 29 Jun 2020 23:45:52 -0400
X-MC-Unique: kGc8j8BhOtSbvcDvcX2_YQ-1
IronPort-SDR: Jd288VGPAwgy4b4TdXOPE/95tmXIVnzoIGOHasWlIv2cKXFbazBZbqFFinPbjLr8ZZ1hOJAgDo
	OvetUAfhr7+/DOMTGWC9S4FI85E0uOgPdekdqCFdq6l6nQUtQVcMXtnUblvNP5xry6QfEX1cx4
	HwYaavGL9CB2cqLS6rUhPRG1Cuf404zVC6UIdJk+t6ADOehNBqCarhx9vo4tLS4Ka5Ywhlgw4o
	KaIsiEg2yyY0XQeEosMsJ24uknLhxAUjV4U9/crPSspgmBWleLSK9rVsavqSIaFcC+uQXB/OJH
	BGw=
X-IronPort-AV: E=Sophos;i="5.75,296,1589212800"; d="scan'208";a="145562266"
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
	NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
	by ob1.hgst.iphmx.com with ESMTP; 30 Jun 2020 11:45:51 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0422.namprd04.prod.outlook.com (2603:10b6:903:bd::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Tue, 30 Jun 2020 03:45:48 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3131.024;
	Tue, 30 Jun 2020 03:45:48 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Thread-Topic: [PATCH v2] dm crypt: add flags to optionally bypass dm-crypt
	workqueues
Thread-Index: AQHWS/06zZqSdIYp0k2e+HMuy61K4w==
Date: Tue, 30 Jun 2020 03:45:48 +0000
Message-ID: <CY4PR04MB37518C4BF580DABEDB1BD8F2E76F0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200626210302.1813-1-ignat@cloudflare.com>
	<CY4PR04MB375127DC313F70875CAAC841E76F0@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200630030944.GA20706@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [199.255.47.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4ff93a97-1b8c-4bc0-8105-08d81ca813eb
x-ms-traffictypediagnostic: CY4PR04MB0422:
x-microsoft-antispam-prvs: <CY4PR04MB04223994B9087856F14C8FEBE76F0@CY4PR04MB0422.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0450A714CB
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nMdZM/49L9+MyaLzSLZLi5u/W4CNN8mWKz+ixKurtgpNI18UkOquVwAtgmj+7vc9PfiR9SjIHb4vnppGNTBrqp7ZhchOz5HCJBwjxZiPktcrb28OeKlACeH7aO1k5X/I6ZuF5+tMcmW777ufnjATwrqZ3+zklAjkaXLabV+gFrH3+siSuirJjULvZCNzdTEjeLGkKoZ0KctKGfI78VkAKLQUqfRb02LaVZMnWnYgZJYJTHJ69FCGvgFTuzmXYp4bIg8QAobFsrK1tHfOnd+BxGJPcQToHbvm3721qFLPf+vN2o6S9y9eYLBkiVyueibKHeSYF4iNy9Adf6cb+Bm5NA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(26005)(66556008)(66946007)(4326008)(6916009)(54906003)(64756008)(186003)(8936002)(66446008)(86362001)(7696005)(91956017)(66476007)(76116006)(316002)(8676002)(71200400001)(7416002)(478600001)(83380400001)(9686003)(53546011)(55016002)(52536014)(6506007)(5660300002)(2906002)(33656002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: WrW4uSxBPIlyRaIlviI9+DssoN+wYZXUJ73x9pOCAMhxWeBtR2PFFMj7LCY8k8INbm99OVUQ6ocOulBgbG94bmsHJ2n5AQlPsEtXf87ESYVuDH1qHylqoLb3/pHUqaqnW/nyT9AgsEv9+S3LkAOKcI23gU6WAk+IuuiIxrrT6B8SnkpY6gFy0aebOEmXQI5pTA9omuMg3UNzM3l5lhAYzoiQTJ0MfflKtbFANFGOvSPRvU30ByvKXY8cisUDSNAGYhw4gelxomm/2uUhFgYOfZNICVOsgtCFRPERho6epKjdPjckzJYth+PaWuvIso4/q/HFZ0QYWwTZ4xEEQ2W9bNnkm3YO6b0tSuoCB+ilht2+9fNbSVSTR8rZim2fYu7IUFTcgiQjDyEN+NvM+smfRjjwp24mnL/wLGFyOpFF2BDKNGEoKrzqvEXNGQO/zMhygYvz+llkhkr7GXMngXpUyMi/yIwXzo29W0RLl4eIrzA=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff93a97-1b8c-4bc0-8105-08d81ca813eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2020 03:45:48.5560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZrfZNnXCRHjVE8zUcSF+f4uxIu8w4jMQS0vFuS646oghFwsQz6UPR5B5+E4J2Qu5i7ht8XPA0+FXKkTcrilKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0422
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05U3k1uD016782
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm crypt: add flags to optionally bypass
 dm-crypt workqueues
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/30 12:09, Herbert Xu wrote:
> On Tue, Jun 30, 2020 at 02:51:17AM +0000, Damien Le Moal wrote:
>>
>>> @@ -1463,12 +1465,12 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>>>  	 * requests if driver request queue is full.
>>>  	 */
>>>  	skcipher_request_set_callback(ctx->r.req,
>>> -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
>>> +	    nobacklog ? 0 : CRYPTO_TFM_REQ_MAY_BACKLOG,
>>>  	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
>>
>> Will not specifying CRYPTO_TFM_REQ_MAY_BACKLOG always cause the crypto API to
>> return -EBUSY ? From the comment above the skcipher_request_set_callback(), it
>> seems that this will be the case only if the skcipher diver queue is full. So in
>> other word, keeping the kcryptd_async_done() callback and executing the skcipher
>> request through crypt_convert() and crypt_convert_block_skcipher() may still end
>> up being an asynchronous operation. Can you confirm this and is it what you
>> intended to implement ?
> 
> The purpose of MAY_BACKLOG is to make the crypto request reliable.
> It has nothing to do with whether the request will be synchronous
> or not.
> 
> Without the backlog flag, if the hardware queue is full the request
> will simply be dropped, which is appropriate in the network stack
> with IPsec where congestion can be dealt with at the source.
> 
> Block layer on the other hand should always use the backlog flag
> and stop sending more requests to the crypto API until the congestion
> goes away.

OK. Thanks for the information. So it sounds like this patch still needs some
more fixes.

> 
> Cheers,
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

