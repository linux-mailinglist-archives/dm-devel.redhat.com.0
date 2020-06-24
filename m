Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE02206E34
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 09:50:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592985012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TlIkurUl4le1xSORdqDVdvh4WEu0f2xUkKkUE9gKZxs=;
	b=ZTSaVaCUnja9FCX7v1iKlW23zwqFbI+AX2QQa/Dx4/GaiyX+wVC4R4Selm/jp2yKVLhAfE
	ccvyW3kgj3pL0h/XG3dPcCUEe6F0z47GskmD5K1/n8dcZxZvcZoqMGAKc6NqYdvaePoqP0
	P2u98tATBvzxRSINO0J8Jw5eoKgUleo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-QFUzcwOiP5O56eP2EtLl9g-1; Wed, 24 Jun 2020 03:50:09 -0400
X-MC-Unique: QFUzcwOiP5O56eP2EtLl9g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6671C107ACF2;
	Wed, 24 Jun 2020 07:50:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A00BD7E59F;
	Wed, 24 Jun 2020 07:50:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A0D11048FD;
	Wed, 24 Jun 2020 07:50:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O7nnR1002776 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 03:49:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B215710E51CF; Wed, 24 Jun 2020 07:49:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACC0610E51D4
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 07:49:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7BDC1049880
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 07:49:46 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-374-Av8wsd3aMMWUPzZHL3rEWg-1; Wed, 24 Jun 2020 03:49:42 -0400
X-MC-Unique: Av8wsd3aMMWUPzZHL3rEWg-1
IronPort-SDR: V6fmFRwZgtLRVqkh9/M1JOoYze7QuxBMABLewOKw1t8igBoANgNXiMTVVOJ5KHrJKSf9i05LMC
	KMyRiAP+GrU6wkJ7/wxIPojidKveLOe2yX3w7LBe4p7lEJCbTPFTeZvQHh58gsazjIW3hRq0O3
	XBqpLQFrAOvC56bFb2Zb5r7F9CRl18r1Y5pIh+YY2PT1BzcqhaUEl5LyrQMXFjhbHQJbwK+iEY
	jzwFbAnaTkMpmIBI7UH9vnZwXUQPxlwIHIJkutk9UgOoq7GJp5RRRM3NkQOXDqtPl3j9nRBh5h
	Qd4=
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; d="scan'208";a="142151319"
Received: from mail-sn1nam04lp2059.outbound.protection.outlook.com (HELO
	NAM04-SN1-obe.outbound.protection.outlook.com) ([104.47.44.59])
	by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2020 15:49:41 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR0401MB3633.namprd04.prod.outlook.com (2603:10b6:910:94::15)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.25;
	Wed, 24 Jun 2020 07:49:38 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Wed, 24 Jun 2020 07:49:38 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Eric Biggers <ebiggers@kernel.org>, Ignat Korchagin <ignat@cloudflare.com>
Thread-Topic: [dm-devel] [dm-crypt] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE
	flag to dm-crypt target
Thread-Index: AQHWSeUPu+0i3SYd0ECUVC1ZCCo3oA==
Date: Wed, 24 Jun 2020 07:49:38 +0000
Message-ID: <CY4PR04MB375123D338D4CB4FD586FE61E7950@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619164132.1648-2-ignat@cloudflare.com>
	<20200624050452.GB844@sol.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4911720-8d6a-4c23-4281-08d81813256f
x-ms-traffictypediagnostic: CY4PR0401MB3633:
x-microsoft-antispam-prvs: <CY4PR0401MB3633F457882CDBF3F72F3432E7950@CY4PR0401MB3633.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rdkC1K4U3KGsl2yqLDZ0j4FO5MAvQL0RmWlnJJCf9n5J3X78DypCx/pEVW0HbJ1iZmB25cNywOr/PQBlYNU3GVqSa1JSQHKUhGDaKY1891is2ZuOtf95YZWrLjA/HjM06xSrc5713+b1UbP8J0gN6RL+nAZiT+kgKEV2hsRsvTkTn5ocFgNvelrhxnvaVE2utA8JLK+f+mOb/Q0GPF+qehW8T74abLU7B27UrNIiB1ybYFOxUsXnLkbkYkSPFuGkXdaG7lEmqEwDu40HQQ/W0vj9ELkYvIOa7yqldKLagPEbDYg57KTZRjRDeS/cE2F8SDFmKCznFbvyu4kTK3TMA3wS/LlGXIoxBZU66PBhyPfaKWF6PutIYIDC79SscLPQZDrCevGnTvtxFpDlNgawqA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(66946007)(91956017)(76116006)(9686003)(66476007)(33656002)(66556008)(64756008)(71200400001)(83380400001)(66446008)(186003)(86362001)(4326008)(8676002)(54906003)(26005)(966005)(8936002)(110136005)(55016002)(6506007)(53546011)(52536014)(316002)(7696005)(5660300002)(478600001)(2906002);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: 3F21mC+Z5/fDo0dh3J/DLeTNkno5AOxwUotFc8boHcmKwA8unwfrgzpmGknhfGpniUyZL32oHK3zKnBIDeexSUkqDiWi0omK8aJeS/aPE0YPk/1ueLR+3YCDvYb0SNY7HLO7c+PHQVs1yPF8Tv6hsUJrzDf/gyjV4rC8MY0MJM0NBKa2x41ZG5bVrH77k0Wu3sKYti2oIBEfgNcQSwz4gRsZbFEhN1qYo713D9n/D1/uOMBWa8uIaNLg6fgeymn/BvhGtXJwSG6x0xkNzdSJ7wErJdLMo1RIJT0+Oz3xpI+k+g8a2oXFJH9HIF3O1nUiEpvaCBicTYvPDbVXkOSEK3Dm/SzfK+/q3Bl/yAbTiql/6TwQ4mNqn8bk6CCHynE3QTorCuKd9brAAaDvlq7VEW3X+ugCw2Vjtqabxqsx0NID7lwRQWnuJFTccnpRLbsNsHaGHP8gIi+aq1W9FxPR9KvXzk0slvRmrSEiOBsqnQGveQTNDX0Bhi7o/dlt/tbo
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4911720-8d6a-4c23-4281-08d81813256f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 07:49:38.3009 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hmmBylYaKN9NRJ3Vn7cRVlYaLSjmFfW/+xb8GIwEDQ0YBHBd7EQF1yGX9/HaR9LzRpWDPGOmljJwaQmnrzFtbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3633
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O7nnR1002776
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"agk@redhat.com" <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/24 14:05, Eric Biggers wrote:
> On Fri, Jun 19, 2020 at 05:41:32PM +0100, Ignat Korchagin wrote:
>> Sometimes extra thread offloading imposed by dm-crypt hurts IO latency. This is
>> especially visible on busy systems with many processes/threads. Moreover, most
>> Crypto API implementaions are async, that is they offload crypto operations on
>> their own, so this dm-crypt offloading is excessive.
> 
> This really should say "some Crypto API implementations are async" instead of
> "most Crypto API implementations are async".
> 
> Notably, the AES-NI implementation of AES-XTS is synchronous if you call it in a
> context where SIMD instructions are usable.  It's only asynchronous when SIMD is
> not usable.  (This seems to have been missed in your blog post.)
> 
>> This adds a new flag, which directs dm-crypt not to offload crypto operations
>> and process everything inline. For cases, where crypto operations cannot happen
>> inline (hard interrupt context, for example the read path of the NVME driver),
>> we offload the work to a tasklet rather than a workqueue.
> 
> This patch both removes some dm-crypt specific queueing, and changes decryption
> to use softIRQ context instead of a workqueue.  It would be useful to know how
> much of a difference the workqueue => softIRQ change makes by itself.  Such a
> change could be useful for fscrypt as well.  (fscrypt uses a workqueue for
> decryption, but besides that doesn't use any other queueing.)
> 
>> @@ -127,7 +128,7 @@ struct iv_elephant_private {
>>   * and encrypts / decrypts at the same time.
>>   */
>>  enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
>> -	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD };
>> +	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD, DM_CRYPT_FORCE_INLINE = (sizeof(unsigned long) * 8 - 1) };
> 
> Assigning a specific enum value isn't necessary.
> 
>> @@ -1458,13 +1459,18 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>>  
>>  	skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
>>  
>> -	/*
>> -	 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
>> -	 * requests if driver request queue is full.
>> -	 */
>> -	skcipher_request_set_callback(ctx->r.req,
>> -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
>> -	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
>> +	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
>> +		/* make sure we zero important fields of the request */
>> +		skcipher_request_set_callback(ctx->r.req,
>> +	        0, NULL, NULL);
>> +	else
>> +		/*
>> +		 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
>> +		 * requests if driver request queue is full.
>> +		 */
>> +		skcipher_request_set_callback(ctx->r.req,
>> +	        CRYPTO_TFM_REQ_MAY_BACKLOG,
>> +	        kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
>>  }
> 
> This looks wrong.  Unless type=0 and mask=CRYPTO_ALG_ASYNC are passed to
> crypto_alloc_skcipher(), the skcipher implementation can still be asynchronous,
> in which case providing a callback is required.

Another point: for a skcipher implementation that is asynchronous, for the
regular case/not-inline, can't we just issue the request directly without using
the workqueue ? If yes, that would save one context switch, since queueing of
the request can be handled by the crypto API when the request callback is set
with CRYPTO_TFM_REQ_MAY_BACKLOG. At least that is how I understood the
documentation & comments. I may be wrong here...

> 
> Do you intend that the "force_inline" option forces the use of a synchronous
> skcipher (alongside the other things it does)?  Or should it still allow
> asynchronous ones?
> 
> We may not actually have a choice in that matter, since xts-aes-aesni has the
> CRYPTO_ALG_ASYNC bit set (as I mentioned) despite being synchronous in most
> cases; thus, the crypto API won't give you it if you ask for a synchronous
> cipher.  So I think you still need to allow async skciphers?  That means a
> callback is still always required.
> 
> - Eric
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

