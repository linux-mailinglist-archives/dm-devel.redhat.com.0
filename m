Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D524C206D97
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 09:26:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592983611;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=VBqXZwpP8DQkameZeahO3j14zCxVR+IDCEvEJlAfpYU=;
	b=MdneGh8S++VGLsv9lej7n1PJpFtQwWfKm8WSF0uvV/klemdcDlV4VR9d/CQHoZhdyTkRva
	a/iIC3n4STrNuCoSVBpvyWONDQMpdcrk+PYaOW1Tq2nGY+xdeJbfjI/VezpH74lfcGZJ2Y
	HqdvFzvt9AQ5FOUgWRB+sT5PaqnCHTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-V_aINL0LMN-GHpWTuSKKDA-1; Wed, 24 Jun 2020 03:26:49 -0400
X-MC-Unique: V_aINL0LMN-GHpWTuSKKDA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CEA9193F561;
	Wed, 24 Jun 2020 07:26:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D73CBA45;
	Wed, 24 Jun 2020 07:26:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53F2D104903;
	Wed, 24 Jun 2020 07:26:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O7OsT2000412 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 03:24:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66D41951A0; Wed, 24 Jun 2020 07:24:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61932D1BC1
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 07:24:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6C00185A78B
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 07:24:51 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-181-wF_Szs-wORWQFvSQAbermQ-1; Wed, 24 Jun 2020 03:24:49 -0400
X-MC-Unique: wF_Szs-wORWQFvSQAbermQ-1
IronPort-SDR: nZKwKwVsyYlMeTIFxNeKePGr0z2z6A/bFh0z2FUZqub2yGT5VbQpzOv9ixUXsenFwaTnfrotGD
	KSEOknR0UEiylupK3LEtCoEFpvH9dd7irX9Xwu9CHk0PoCKL64hrCARcQ287hNvKrZER0uJU9l
	ec7wnUMst1gpRqGKbxpnl1JUh4qUpFKFhGauhinhwjTQSNFxAuqr2L/CJboTa6Lh84meKMK3Uv
	L8AFcLjF5Yip55eM/nVxC+ixWJ0qCCcYtD5iTlvBph010fTzQS3sADE0Vgj09i6bgaQNrroYK0
	kuk=
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; d="scan'208";a="145102576"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
	by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2020 15:24:47 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1206.namprd04.prod.outlook.com (2603:10b6:903:b8::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23;
	Wed, 24 Jun 2020 07:24:46 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Wed, 24 Jun 2020 07:24:46 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: [dm-devel] [dm-crypt] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE
	flag to dm-crypt target
Thread-Index: AQHWSeUPu+0i3SYd0ECUVC1ZCCo3oA==
Date: Wed, 24 Jun 2020 07:24:46 +0000
Message-ID: <CY4PR04MB37510A3565060D9243607A80E7950@CY4PR04MB3751.namprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 943ff73e-9570-4be5-1ae5-08d8180fac38
x-ms-traffictypediagnostic: CY4PR04MB1206:
x-microsoft-antispam-prvs: <CY4PR04MB1206D53CBD70E6872C6B2879E7950@CY4PR04MB1206.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ev2co5UVELn9HyB9ZMJ/LkhZ6Pabiv7GlTVa+w+4B+l7yo7nxwfOi9twhwhPR7LdR+R+l2ZOmovB3TSYWf4vzk5Xlb8g+4Fok2hEtiKmEdMkUMfvJirLJCf8Hx0lE4Tk+wkVQxqGcl95OZsipEtpgkm9q0ohv4LUEZ83XVBrZs9af8/41YvJZssaoSVbisYb1VMSbtZqFBdUicgcViwsd0iJTXNradLq5sGEtxPdCIsxizaIDDqYVu99rASXq0TMdz7Dk//UgA3469Qix7t02+Y9BsSmh2rl7bkR0ZWYwdVWvxiwPiSh/JH8xWsk6cJ0IGk5Ivx+uNPar+UL6adB8Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(6506007)(9686003)(66946007)(5660300002)(86362001)(8676002)(26005)(186003)(8936002)(66446008)(66476007)(66556008)(64756008)(2906002)(91956017)(55016002)(76116006)(4326008)(7696005)(54906003)(83380400001)(53546011)(33656002)(52536014)(71200400001)(316002)(478600001)(6916009);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: FA3cK2Huw7aAqJUeDumuBUmSRJ5bX70Prp7HcS0V6DdYiQZOrmjLdekDKPmIZh2o0pN0FVJLUThFFCICe0zYnEtICFZBe1oDZ3g6c/qOx0aMRCFQa0cY7fxOX/SwMul4RpR0xzY6znkAmqL+A8QGSXmxKljxCpivtOZBYAVFP2mGXZieYwYYhQjYi/L2NcRZWzG7ktGm9X7Gy/qrtjSef2fH/Msoou6JAMpWjbShYaVifGGA9M+Doj4oR+aE0m8EORXC8stF8qQkYRbmGZaPgVAxmyhjS+xp1GNF3QOM6IlqA4nB0E3I0yR6s+zgfE+BnY69g2Bzfm70v7sWXgSfD82qZHVCrxcqJWx6KBuQdPAjHusj/S13/ygBi9sWW+abhRyZuocSSQajpYxwcNCoR7GmL2AszD4D4bM65xRYgKdi81el5Y4ntFkzgXWNvhK9zMLvGnG/I4gRpuMba5WU0vNJLKdRPTyDldLYvoq1mN8OJzsqTGzdiql+RWu8m8+F
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943ff73e-9570-4be5-1ae5-08d8180fac38
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 07:24:46.4320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 52Wv79OEgiyno+qOqVh3I1203lDAgQINHgdF07ex9OC27uXBtxm+bg4OOCgBiFImUPJ7rqMgnaPCUV91W2XPUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1206
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O7OsT2000412
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Digging the code further, in light of your hints, it looks like to fix this, all
that needs to be done is to change crypt_convert_block_skcipher() from doing:

	if (bio_data_dir(ctx->bio_in) == WRITE)
		r = crypto_skcipher_encrypt(req);
	else
		r = crypto_skcipher_decrypt(req);

to do something like:

	struct crypto_wait wait;

	...

	if (bio_data_dir(ctx->bio_in) == WRITE) {
		if (test_bit(DM_CRYPT_FORCE_INLINE_WRITE, &cc->flags))
			r = crypto_wait_req(crypto_skcipher_encrypt(req),
					    &wait);
		else
			r = crypto_skcipher_encrypt(req);
	} else {
		if (test_bit(DM_CRYPT_FORCE_INLINE_READ, &cc->flags))


			r = crypto_wait_req(crypto_skcipher_decrypt(req),
					    &wait);
		else
			r = crypto_skcipher_decrypt(req);
	}

Doing so, crypt_convert_block_skcipher() cannot return -EBUSY nor -EINPROGRESS
for inline IOs, leading to crypt_convert() to see synchronous completions, as
expected for inline case. The above likely does not add much overhead at all for
synchronous skcipher/accelerators, and handles asynchronous ones as if they were
synchronous. Would this be correct ?



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
> 
> We do this in fs/crypto/, for example.  (Not many people are using fscrypt with
> crypto API based accelerators, so there hasn't yet been much need to support the
> complexity of issuing multiple async crypto requests like dm-crypt supports.)
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

