Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 55AFA206BA0
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 07:21:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592976115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+5IzaIKhYHiOxjdRou2bnUpRfnRdlzd+WWtOjroUOtc=;
	b=Eb/s1YPV/ef6cz9AXncQ9YdkxQFTL85N6eMt0jMYJxYcT/+k2XuCDwO7/gcEaLaVFeVm6c
	Fll+LgyfmsW+6Ba5fBXFPlMBWEc/yH9ROk+AgAfJ6RJpH50ECoEytjaD33YwsZGLp7PGgz
	+V1IvUZkg346aDcyhTcx/nzmow/5Fts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-A_Brm5r0PYS97KDJqKAJgw-1; Wed, 24 Jun 2020 01:21:53 -0400
X-MC-Unique: A_Brm5r0PYS97KDJqKAJgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADD2107ACCA;
	Wed, 24 Jun 2020 05:21:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 175E679310;
	Wed, 24 Jun 2020 05:21:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C09D833D3;
	Wed, 24 Jun 2020 05:21:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O5LajK019929 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 01:21:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 274DB10E4D1B; Wed, 24 Jun 2020 05:21:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A3010E4D17
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 05:21:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE765805C1E
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 05:21:32 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-159-gpWrBjflNouOeYcujGkdCg-1; Wed, 24 Jun 2020 01:21:28 -0400
X-MC-Unique: gpWrBjflNouOeYcujGkdCg-1
IronPort-SDR: 5CflCLXQ2UQs8T/wMc6nLB/j+bqlVVi1Y3LZelAtTW7C0hXlnse4PyzTux7ejC8tDF2INnr5kJ
	I27DD6HNL6tml8rMbFD9Jg0JSDfnGDEP+E3bAABsvKP0gVQ13CV6nIJmU+ULzUUMgDA7XcGoF3
	RBRKMv7bfBkud/VPx3FeuPBeZtBCPWA7Z952rHKNBuwPreYuKn8rhMLaaC/vmVUECdft7Ft/96
	jvKvNraz49wYv7ThMcyTMdX6UEJvyMjb3IrYkwCQYG2eT0TmlCee/TJ9iZQjaqK8jmbSolLKcG
	kuQ=
X-IronPort-AV: E=Sophos;i="5.75,274,1589212800"; d="scan'208";a="249977918"
Received: from mail-mw2nam10lp2107.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.107])
	by ob1.hgst.iphmx.com with ESMTP; 24 Jun 2020 13:21:26 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB0375.namprd04.prod.outlook.com (2603:10b6:903:b2::23)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.24;
	Wed, 24 Jun 2020 05:21:25 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3109.023;
	Wed, 24 Jun 2020 05:21:25 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Eric Biggers <ebiggers@kernel.org>, Ignat Korchagin <ignat@cloudflare.com>
Thread-Topic: [dm-devel] [dm-crypt] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE
	flag to dm-crypt target
Thread-Index: AQHWSeUPu+0i3SYd0ECUVC1ZCCo3oA==
Date: Wed, 24 Jun 2020 05:21:24 +0000
Message-ID: <CY4PR04MB37515EB3C74CCAE2A006202FE7950@CY4PR04MB3751.namprd04.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: d54ef20c-e58a-4ef8-8e7f-08d817fe70a5
x-ms-traffictypediagnostic: CY4PR04MB0375:
x-microsoft-antispam-prvs: <CY4PR04MB03752FB83F6E3A73ACAB20BAE7950@CY4PR04MB0375.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kONO3pegNOAQDvBVx9NsiaAjGWrBMG0PA2lLQ8pxKLb8DhF87ROhi5tsjKovOmqLiLJMCxkeumGMpnrJybiTWb8rKf4xU5AuGHgon18mmjo31TbTid8MTbX38ppUVElYnWY/iUpxLMuVphwrHi1hTFwLTbf6yXJ8xDvxL31Cdwu6oDjwhL1k5zkW1OW2FMCih9QEQMQJyDYG/SjsyXPGiFAQqEQjNn1KmHoXykeirptOQgUjH+O9wlaLZbx9qwIATyxuqNHjCsRN4HGHXotXAsVIAfCqe2OlSjlIVSylpzi5PBevtVZRGRshrbuxfQRBfB4g9GWupvP332RxMTkRlNHWt7l0Do/VpQ58xjQC0WJu5R+XJGCpiuTE6ypky5oE5Jn2D9uCc8tRBHvyO/y2Lg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(26005)(186003)(5660300002)(55016002)(9686003)(966005)(2906002)(316002)(52536014)(110136005)(54906003)(53546011)(6506007)(7696005)(8676002)(71200400001)(8936002)(33656002)(86362001)(66476007)(66446008)(76116006)(83380400001)(66556008)(91956017)(64756008)(478600001)(4326008)(66946007);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: KeNgUM2jMGjRoPBRuNm4hrEZe111+HlF7QGepfGxT5TEh0a6UvOA2uCtSSuAj/rlDqBb8xhifg5PBv6pzqd52K05QsRng41t22cPQQOvhC4AxatFmxO10Lt2PvUv2ZUrokYQ8ajtaYFNeQGQq8u4dB3YvYDwpbIh9Khh8SvNtWolChcac1yZpO6ZRPGZSRJoArYC5aIJ8T+Gw1WLKZ+fO9kInc/Z0JrivIJq3sDpNXsAw7BLRnw9KyiNWMs+3r+895De9NafqTf2vz51A2UKUyr81+z4eJqCI5u4KFG9hwF3lEGwmR15iiHQOwYFKvcD1K83hI/mBRwoZXB/xCg1YPUdSfPHUNGv8ybyKYzXqBGxjNlWQs+f5X7mKKCgKcoNKF7y5IwTNfBqS8qFsObLsCn80QZIeRScsrMPkldj6AVYHD1VnHqT58LOE/sEGpjfV035zgLNi6TuErVRyC8lEb3kSLUXd/NomSQhz2EB8IqqblAR12Xs8+/yzE6iqPFA
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54ef20c-e58a-4ef8-8e7f-08d817fe70a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 05:21:24.9766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ol85xOgReHUxcfmqSnk4F/HA57+1KiAQpGRTab7YIN77UrVa6AXLz1k6Qjw/vP8t6nlJGGm1AR6FLYRAa4CyJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0375
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05O5LajK019929
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Arg... So it means that some skciphers will not be OK at all for SMR writes. I
was not aware of these differences (tested with aes-xts-plain64 only). The ugly
way to support async ciphers would be to just wait inline for the crypto API to
complete using a completion for instance. But that is very ugly. Back to
brainstorming, and need to learn more about the crypto API...

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

