Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDB1206CED
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 08:47:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592981243;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=sEtSEd2p9xvOp4Dev4j71VkS7YzpmQ58EbRJ1cs6Z8M=;
	b=Q9RluWZ04IC7NL9h0YPnEa8y5oBlN4MoRYmReLb+wRzFRpHKJ1O2IFghQjtWEzZyKAtqOe
	xM6kjt6Z9ecrJ7Ct4t62LesAF2dMtoXxJKXnGtk/9JZ0zvF/lHuuZTYDHgI0189pJRUUfn
	WLUzcto9pGt+JVBvbW3YKzd/AThX8fU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372--v3_ydwaM8mPw1JUI5B3ow-1; Wed, 24 Jun 2020 02:47:20 -0400
X-MC-Unique: -v3_ydwaM8mPw1JUI5B3ow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2ABD887950B;
	Wed, 24 Jun 2020 06:47:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E2D62B5B7;
	Wed, 24 Jun 2020 06:47:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DEF5833D3;
	Wed, 24 Jun 2020 06:46:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O6kh1v028349 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 02:46:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3FEE310CD91D; Wed, 24 Jun 2020 06:46:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ABDB10CD91C
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 06:46:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51462101A525
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 06:46:40 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-260-9S-ZAnu9MJyAC8_xNl7kqg-1; Wed, 24 Jun 2020 02:46:37 -0400
X-MC-Unique: 9S-ZAnu9MJyAC8_xNl7kqg-1
IronPort-SDR: wkMF2LM8J8lYs95fawUk0BISth5q/icDVR8VdzVjbPptwMUQ1ZHyLfx9EKl9FiiPt76eoF1eRu
	Qz37h49iYPZ9ed0EozanQ1thFynFScpNl+U+xamV0rnCjIluAqqiH2Je80Dq2Ifg5u/wLbKtX5
	oNE08KJOd7JPMgR5vsRwDMiPvF1Eg6KkDhLOXRDEluadQnLOBX5QFLHsT56ezmo3mkiU9ZlXtf
	3tyD3t8yj884xnt1aL4fEpnpwRtRwUS+9Hi2Bx8HSkHR0Ii8c3Sf5pFZxLFogL2msWmZsPFCAb
	hus=
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; d="scan'208";a="141013120"
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
	by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2020 14:46:35 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY1PR04MB2345.namprd04.prod.outlook.com (2a01:111:e400:c60e::27)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23;
	Wed, 24 Jun 2020 06:46:33 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Wed, 24 Jun 2020 06:46:33 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [dm-devel] [dm-crypt] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE
	flag to dm-crypt target
Thread-Index: AQHWSeUPu+0i3SYd0ECUVC1ZCCo3oA==
Date: Wed, 24 Jun 2020 06:46:33 +0000
Message-ID: <CY4PR04MB375103F66A8064B0EAF8946BE7950@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619164132.1648-2-ignat@cloudflare.com>
	<20200624050452.GB844@sol.localdomain>
	<CY4PR04MB37515EB3C74CCAE2A006202FE7950@CY4PR04MB3751.namprd04.prod.outlook.com>
	<20200624052739.GC844@sol.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7163ea2b-d1e0-4488-d711-08d8180a5577
x-ms-traffictypediagnostic: CY1PR04MB2345:
x-microsoft-antispam-prvs: <CY1PR04MB23455E05053F9BDC55AE1C39E7950@CY1PR04MB2345.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tv/xCVSPhb3udGKAUY9ky7/lOhOJ6wz9RWxY9PfHsh5x2Qdqr7Fvr7nEAMLkkWfQUh5B5okquTfBlPYIe5YMuTj98z2TdO9r03L7VRtnYJeVx89uXs8OTmvP8ryHaasSJ06j+L19/4fKTg0lSrQwKzbV/Sao5rOkKL1w8FA9HflrJVmZaFr0FRZcmLQ798NlMtEL7Vq2FhBqJD/2tmiT/1RUt9qZ1IK8gdpaKQDGiYj5Pp4/YEEJ7qb1+dI0cfJ3Pk75Apw7mvDVpTiT01aaZat0FZAn9F1IzlFoofl0rysF+0l6NBpUK3lpAG/vC4M+1xP1nLJ7r6sckveonWKc6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(91956017)(76116006)(66946007)(4326008)(7696005)(8676002)(66556008)(64756008)(66446008)(66476007)(55016002)(53546011)(71200400001)(6506007)(83380400001)(86362001)(9686003)(6916009)(478600001)(26005)(33656002)(8936002)(186003)(2906002)(5660300002)(316002)(52536014)(54906003);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: aL9233LYV1Le1pg9Nr5L8bnTP92otOHqNaZiE/bot1pLDhj8tRKKPZMvT8UXa5lsJRY//WrnReDZAT3O/nqxJvh/P51ui5Nu22gERV1uzTUY6ZY908voOFvvZ6AAfQXnnDKXmuME4//4spplrttMaV5goo6rifI2BYy83J7sgZv+3iPQgvdZxzj3HdHUIp7yp775Wqf3xuGxtOS42mbNMHYsKp+7bCJIA66RyycRQWHx6ITGtdNka4g5EW/I6E8EeksdN6MCseckws+wBI5wTWuDfKtmkqozHZtaXfEF7DSwu3vX0TM5rmdceOw8Uajc6/QYRBj6E0sf18dJ5ljElbPNkwq4fV/f/+Y40g0MZk8lfDgbPYRc857dVqfzoUCFVPhoeeHUN0xhtLKq+7ZJWbJj5kFs/64RT/st7I1pt1QhDzlHGWyvYpEIGmWg/dpzOP7yTTRO8o3wDIivX55nHWkjq4eiML/gi1SH4wsjlPhzgebWYRaes0yJuKdadhga
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7163ea2b-d1e0-4488-d711-08d8180a5577
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 06:46:33.4642 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CnuvDgRsAlByeeXN5sxj7xSBZESyGReesEq54EkoF0mho/WkCqs92aIfH2sIxA7Po7nDQDBezkxE9bPFrurEWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR04MB2345
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O6kh1v028349
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [dm-crypt] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE
 flag to dm-crypt target
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/24 14:27, Eric Biggers wrote:
> On Wed, Jun 24, 2020 at 05:21:24AM +0000, Damien Le Moal wrote:
>>>> @@ -1458,13 +1459,18 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>>>>  
>>>>  	skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
>>>>  
>>>> -	/*
>>>> -	 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
>>>> -	 * requests if driver request queue is full.
>>>> -	 */
>>>> -	skcipher_request_set_callback(ctx->r.req,
>>>> -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
>>>> -	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
>>>> +	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
>>>> +		/* make sure we zero important fields of the request */
>>>> +		skcipher_request_set_callback(ctx->r.req,
>>>> +	        0, NULL, NULL);
>>>> +	else
>>>> +		/*
>>>> +		 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
>>>> +		 * requests if driver request queue is full.
>>>> +		 */
>>>> +		skcipher_request_set_callback(ctx->r.req,
>>>> +	        CRYPTO_TFM_REQ_MAY_BACKLOG,
>>>> +	        kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
>>>>  }
>>>
>>> This looks wrong.  Unless type=0 and mask=CRYPTO_ALG_ASYNC are passed to
>>> crypto_alloc_skcipher(), the skcipher implementation can still be asynchronous,
>>> in which case providing a callback is required.
>>>
>>> Do you intend that the "force_inline" option forces the use of a synchronous
>>> skcipher (alongside the other things it does)?  Or should it still allow
>>> asynchronous ones?
>>>
>>> We may not actually have a choice in that matter, since xts-aes-aesni has the
>>> CRYPTO_ALG_ASYNC bit set (as I mentioned) despite being synchronous in most
>>> cases; thus, the crypto API won't give you it if you ask for a synchronous
>>> cipher.  So I think you still need to allow async skciphers?  That means a
>>> callback is still always required.
>>
>> Arg... So it means that some skciphers will not be OK at all for SMR writes. I
>> was not aware of these differences (tested with aes-xts-plain64 only). The ugly
>> way to support async ciphers would be to just wait inline for the crypto API to
>> complete using a completion for instance. But that is very ugly. Back to
>> brainstorming, and need to learn more about the crypto API...
>>
> 
> It's easy to wait for crypto API requests to complete if you need to --
> just use crypto_wait_req().

OK. Thanks for the information. I will look into this and the performance
implications. A quick grep shows that a lot of different accelerators for
different architectures have CRYPTO_ALG_ASYNC set. So definitely something that
needs to be checked for SMR, and for Ignat inline patch.

> We do this in fs/crypto/, for example.  (Not many people are using fscrypt with
> crypto API based accelerators, so there hasn't yet been much need to support the
> complexity of issuing multiple async crypto requests like dm-crypt supports.)

Zonefs fscrypt support is on my to do list too :)

Thanks !

>
> - Eric
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

