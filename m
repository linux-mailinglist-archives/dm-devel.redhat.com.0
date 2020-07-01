Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id E02B0210262
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 05:11:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-bSCPdtO2PGyhv9cDa0DxqA-1; Tue, 30 Jun 2020 23:11:33 -0400
X-MC-Unique: bSCPdtO2PGyhv9cDa0DxqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA16F800C64;
	Wed,  1 Jul 2020 03:11:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 294D61001B2B;
	Wed,  1 Jul 2020 03:11:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 014631809547;
	Wed,  1 Jul 2020 03:11:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0613ArO1027670 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 23:10:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 734B811921A8; Wed,  1 Jul 2020 03:10:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3ABB11921B1
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 03:10:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F01D800883
	for <dm-devel@redhat.com>; Wed,  1 Jul 2020 03:10:46 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-464-VCrf3U17Mba4ut-9nezbhQ-1; Tue, 30 Jun 2020 23:10:41 -0400
X-MC-Unique: VCrf3U17Mba4ut-9nezbhQ-1
IronPort-SDR: C8xmXGLU94zB9GuRUCEnlBbb/XVoNpWek3z01SjXfmhJ43hLWhYuXrZHwgu98wrUXFH1zouiWB
	WWTKY4vfDIgh3vlvJBRcF4DG2A72psuerPZVinIG+XcGyODseEVCRpzkOlKHZTNq8I82tUR8jf
	gkxSpe07RB3EJWCIvzRe6lV19/4LGTGWdHIi/PbmGTW4LSFF9dXx8wnh8nGZ3cnweT4vb1JJyc
	Tn9Ib1+MDNjDM6XW12hQUNuqedLwo070mgST7qkpBlJjpVWBXr27ub/P5QElrjQ9DMODTVK/Es
	qK0=
X-IronPort-AV: E=Sophos;i="5.75,298,1589212800"; d="scan'208";a="141539475"
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2020 11:10:40 +0800
Received: from CY4PR04MB3751.namprd04.prod.outlook.com (2603:10b6:903:ec::14)
	by CY4PR04MB1033.namprd04.prod.outlook.com (2603:10b6:910:54::14)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21;
	Wed, 1 Jul 2020 03:10:38 +0000
Received: from CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7]) by CY4PR04MB3751.namprd04.prod.outlook.com
	([fe80::c593:f271:eebe:ac7%9]) with mapi id 15.20.3131.024;
	Wed, 1 Jul 2020 03:10:37 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Thread-Topic: [PATCH v2] dm crypt: add flags to optionally bypass dm-crypt
	workqueues
Thread-Index: AQHWS/06zZqSdIYp0k2e+HMuy61K4w==
Date: Wed, 1 Jul 2020 03:10:37 +0000
Message-ID: <CY4PR04MB375171927DD3506E0958A2FCE76C0@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200626210302.1813-1-ignat@cloudflare.com>
	<CY4PR04MB375127DC313F70875CAAC841E76F0@CY4PR04MB3751.namprd04.prod.outlook.com>
	<CALrw=nFu+ZQ5qP+2OuZa470rjPDEVLNDc5-YLaYGpi2Ke1d6Fw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [129.253.182.57]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 73247b62-c0ea-43b8-b99e-08d81d6c5436
x-ms-traffictypediagnostic: CY4PR04MB1033:
x-microsoft-antispam-prvs: <CY4PR04MB103383FDC72F6A96207C0553E76C0@CY4PR04MB1033.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m6hXkpx8w7viyQqQ+w4mf/FeZ/s7dMaQ8t9qUbOrTAsIrjTc3reA/3vutMrtes1UJGBSWVBF18qK4LhJbulcljGoLN5a1+Hh4FHYE/hwZkLPqoGPGH3mvkR4MyHkTZ7eDkK5KDwakeOJARVh5LXHBIGEYCe9npoFriMBtbam2VEQa90zyhtmoGqzIdkE+hHg8X4m362DKpVwk70oTRQDGrBP+EKWfHw6OCcb5WByr414ATQAq9gOZz2ogDPtsswg3egXbbYZ3Jy3Q6Dylq6/98LlYdXM+6dsyGIv7eD2QXXmrjK1AB421U6rYZHU1xlLq1lkdJ4rrJvTXXXJTosQtFmHQq+A18XgzQ8rG8guG+yRJY8TAzGKJMX9xbcLeFtc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
	IPV:NLI; SFV:NSPM; H:CY4PR04MB3751.namprd04.prod.outlook.com;
	PTR:; CAT:NONE; SFTY:;
	SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(7696005)(8676002)(6916009)(478600001)(5660300002)(54906003)(86362001)(6506007)(71200400001)(8936002)(7416002)(53546011)(33656002)(2906002)(26005)(55016002)(186003)(52536014)(9686003)(316002)(83380400001)(66556008)(66446008)(91956017)(76116006)(30864003)(4326008)(66946007)(66476007)(64756008)(309714004);
	DIR:OUT; SFP:1102;
x-ms-exchange-antispam-messagedata: lEK1xx+tncfCMIXIhjy8Vw8W3B8pvYRXk9tkXKUGqPUW/sF1kc/NSEW1RttDmtBf5UuKMOnATixwTuqHryECCOFMJnjiPq8mfzM1GR+YgGqFpmZ8c9QyzQPFKzVwgnxxob6FRqm1s+OCJ1MnCecL8f2wfX68rd/c7GN6nm/1RBrW510s/RR6ARQUaaKpPPshuTGwmhvEXT/sJHFhkcEN2r+t/aElluEGiHEKIxwk2ZWeE0JWrX0olg8yNL6JOln2bKTcVZiYxt9MtsEJVnvzDtCF7QJd8pR/l3Il/9m6sLM3djv1fIwIaD+D3jsqgJznFtp/I1/Rsy21LEBGKiRwCFL1R1kAMXpf7OrV7OFVaJoRHZUQdfbd81ALQIUnvlFnuTyX3V1b86gHtOddfZtQN/dE1eQnG3zl3PwmgvElwpQ7cslJcaKAqoT5T/bh5dzcEJV/ksBi+A+DKoaezzZ75jZQio5efHSufUKdufa+gx3uc4hCTG/RLD18B7X90Udn
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB3751.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73247b62-c0ea-43b8-b99e-08d81d6c5436
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 03:10:37.7921 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v86oC+vjDCKJGY6k+dUeeXzl6aLKog5lSpbIhzNOORvRfal9zsj9K9quJuVP5Sj5vPnAhLL1162L3UaXjIXHig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB1033
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0613ArO1027670
X-loop: dm-devel@redhat.com
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"ebiggers@kernel.org" <ebiggers@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	"agk@redhat.com" <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/06/30 18:35, Ignat Korchagin wrote:
[...]
>>> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
>>> index 000ddfab5ba0..6924eb49b1df 100644
>>> --- a/drivers/md/dm-crypt.c
>>> +++ b/drivers/md/dm-crypt.c
>>> @@ -69,6 +69,7 @@ struct dm_crypt_io {
>>>       u8 *integrity_metadata;
>>>       bool integrity_metadata_from_pool;
>>>       struct work_struct work;
>>> +     struct tasklet_struct tasklet;
>>>
>>>       struct convert_context ctx;
>>>
>>> @@ -127,7 +128,8 @@ struct iv_elephant_private {
>>>   * and encrypts / decrypts at the same time.
>>>   */
>>>  enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
>>> -          DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD };
>>> +          DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD,
>>> +          DM_CRYPT_NO_READ_WORKQUEUE, DM_CRYPT_NO_WRITE_WORKQUEUE };
>>
>> I liked the "INLINE" naming. What about DM_CRYPT_READ_INLINE and
>> DM_CRYPT_WRITE_INLINE ? Shorter too :)
>>
>> But from the changes below, it looks like your change is now less about being
>> purely inline or synchronous but about bypassing the workqueue.
>> Is this correct ?
> 
> Yes, from the test with the NULL cipher it is clearly visible that
> workqueues are the main cause of the performance degradation. The
> previous patch actually did the same thing with the addition of a
> custom xts-proxy synchronous module, which achieved "full inline"
> processing. But it is clear now, that inline/non-inline Crypto API
> does not change much from a performance point of view.

OK. Understood. So the name DM_CRYPT_NO_READ_WORKQUEUE and
DM_CRYPT_NO_WRITE_WORKQUEUE make sense. They indeed are very descriptive.
I was just wondering how to avoid confusion with the DM_CRYPT_NO_OFFLOAD flag
for writes with better names. But I do not have better ideas :)

> 
>>>
>>>  enum cipher_flags {
>>>       CRYPT_MODE_INTEGRITY_AEAD,      /* Use authenticated mode for cihper */
>>> @@ -1449,7 +1451,7 @@ static void kcryptd_async_done(struct crypto_async_request *async_req,
>>>                              int error);
>>>
>>>  static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>>> -                                  struct convert_context *ctx)
>>> +                                  struct convert_context *ctx, bool nobacklog)
>>>  {
>>>       unsigned key_index = ctx->cc_sector & (cc->tfms_count - 1);
>>>
>>> @@ -1463,12 +1465,12 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>>>        * requests if driver request queue is full.
>>>        */
>>>       skcipher_request_set_callback(ctx->r.req,
>>> -         CRYPTO_TFM_REQ_MAY_BACKLOG,
>>> +         nobacklog ? 0 : CRYPTO_TFM_REQ_MAY_BACKLOG,
>>>           kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
>>
>> Will not specifying CRYPTO_TFM_REQ_MAY_BACKLOG always cause the crypto API to
>> return -EBUSY ? From the comment above the skcipher_request_set_callback(), it
>> seems that this will be the case only if the skcipher diver queue is full. So in
>> other word, keeping the kcryptd_async_done() callback and executing the skcipher
>> request through crypt_convert() and crypt_convert_block_skcipher() may still end
>> up being an asynchronous operation. Can you confirm this and is it what you
>> intended to implement ?
> 
> Yes, so far these flags should bypass dm-crypt workqueues only. I had
> a quick look around CRYPTO_TFM_REQ_MAY_BACKLOG and it seems that both
> generic xts as well as aesni implementations (and other crypto
> involved in disk encryption) do not have any logic related to the
> flag, so we may as well leave it as is.

OK. Sounds good. Less changes :)

>> From my understanding of the crypto API, and from what Eric commented, a truly
>> synchronous/inline execution of the skcypher needs a call like:
>>
>> crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
>>
>> For SMR use case were we must absolutely preserve the write requests order, the
>> above change will probably be needed. Will check again.
> 
> I think this is not an "inline" execution, rather blocking the current
> thread and waiting for the potential asynchronous crypto thread to
> finish its operation.

Well, if we block waiting for the crypto execution, crypto use becomes "inline"
in the context of the BIO submitter, so the write request order is preserved.
More a serialization than pure inlining, sure. But in the end, exactly what is
needed for zoned block device writes.

> It seems we have different use-cases here. By bypassing workqueues we
> just want to improve performance, but otherwise do not really care
> about the order of requests.

Yes. Understood. Not using the current workqueue mechanism for writes to zoned
devices is necessary because of write ordering. The performance aspect of that
is the cherry on top of the SMR support cake :)

> Waiting for crypto to complete synchronously may actually decrease
> performance, but required to preserve the order in some cases. Should
> this be a yet another flag?

Yes, blocking may be a performance concern. I will be checking this carefully.
As for another flag, I do not think one is needed:
1) Using bdev_is_zoned(), zoned drives can be trivially identified and
DM_CRYPT_NO_WRITE_WORKQUEUE forced-set.
2) Any other additional change needed for zoned block device write requests
handling can be conditional on bdev_is_zoned() & bio_op() == REQ_OP_WRITE.

Currently, for zoned block device write, I see 2 different approaches I need to
check & test:

1) If the crypto API calls with BACKLOG set preserve request order (creq
completion order is the same as issuing order), then all that is needed is force
setting DM_CRYPT_NO_WRITE_WORKQUEUE for zoned devices.
2) If (1) does not hold, then excuting encrypt operations with crypto_wait_req()
should work. Blocking may be an issue with performance though.

Another possible approach may be to use a modified write_tree/write_thread to
include the crypto calls together with backend BIO issuing in sector order. But
that may just add unnecessary context switches.

Once you send a v3 of your patch with BACKLOG fix and other cleanups, I will
rebase my work and try different things.

Thanks !

> 
>>>  }
>>>
>>>  static void crypt_alloc_req_aead(struct crypt_config *cc,
>>> -                              struct convert_context *ctx)
>>> +                              struct convert_context *ctx, bool nobacklog)
>>>  {
>>>       if (!ctx->r.req_aead)
>>>               ctx->r.req_aead = mempool_alloc(&cc->req_pool, GFP_NOIO);
>>> @@ -1480,17 +1482,17 @@ static void crypt_alloc_req_aead(struct crypt_config *cc,
>>>        * requests if driver request queue is full.
>>>        */
>>>       aead_request_set_callback(ctx->r.req_aead,
>>> -         CRYPTO_TFM_REQ_MAY_BACKLOG,
>>> +         nobacklog ? 0 : CRYPTO_TFM_REQ_MAY_BACKLOG,
>>>           kcryptd_async_done, dmreq_of_req(cc, ctx->r.req_aead));
>>>  }
>>>
>>>  static void crypt_alloc_req(struct crypt_config *cc,
>>> -                         struct convert_context *ctx)
>>> +                         struct convert_context *ctx, bool nobacklog)
>>>  {
>>>       if (crypt_integrity_aead(cc))
>>> -             crypt_alloc_req_aead(cc, ctx);
>>> +             crypt_alloc_req_aead(cc, ctx, nobacklog);
>>>       else
>>> -             crypt_alloc_req_skcipher(cc, ctx);
>>> +             crypt_alloc_req_skcipher(cc, ctx, nobacklog);
>>>  }
>>>
>>>  static void crypt_free_req_skcipher(struct crypt_config *cc,
>>> @@ -1523,7 +1525,7 @@ static void crypt_free_req(struct crypt_config *cc, void *req, struct bio *base_
>>>   * Encrypt / decrypt data from one bio to another one (can be the same one)
>>>   */
>>>  static blk_status_t crypt_convert(struct crypt_config *cc,
>>> -                      struct convert_context *ctx)
>>> +                      struct convert_context *ctx, bool noresched)
>>
>> "noresched" is named after what will happen, not after the reason for it. So to
>> clarify, why not rename this as "convert_inline" or "do_inline" ?
>>
>>>  {
>>>       unsigned int tag_offset = 0;
>>>       unsigned int sector_step = cc->sector_size >> SECTOR_SHIFT;
>>> @@ -1533,7 +1535,7 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
>>>
>>>       while (ctx->iter_in.bi_size && ctx->iter_out.bi_size) {
>>>
>>> -             crypt_alloc_req(cc, ctx);
>>> +             crypt_alloc_req(cc, ctx, noresched);
>>>               atomic_inc(&ctx->cc_pending);
>>>
>>>               if (crypt_integrity_aead(cc))
>>> @@ -1566,7 +1568,8 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
>>>                       atomic_dec(&ctx->cc_pending);
>>>                       ctx->cc_sector += sector_step;
>>>                       tag_offset++;
>>> -                     cond_resched();
>>> +                     if (!noresched)
>>> +                             cond_resched();
>>>                       continue;
>>>               /*
>>>                * There was a data integrity error.
>>> @@ -1879,6 +1882,9 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
>>>       unsigned long flags;
>>>       sector_t sector;
>>>       struct rb_node **rbp, *parent;
>>> +     bool nosort =
>>> +                     (likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) ||
>>> +                     test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags);
>>
>> "nosort" is a little obscure as a name. Why not just "do_inline" ? In any case,
>> since this bool is used only in the if below, you could just write the condition
>> directly there.
>>
>>>
>>>       if (unlikely(io->error)) {
>>>               crypt_free_buffer_pages(cc, clone);
>>> @@ -1892,7 +1898,7 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
>>>
>>>       clone->bi_iter.bi_sector = cc->start + io->sector;
>>>
>>> -     if (likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) {
>>> +     if (nosort) {
>>>               generic_make_request(clone);
>>>               return;
>>>       }
>>> @@ -1941,7 +1947,7 @@ static void kcryptd_crypt_write_convert(struct dm_crypt_io *io)
>>>       sector += bio_sectors(clone);
>>>
>>>       crypt_inc_pending(io);
>>> -     r = crypt_convert(cc, &io->ctx);
>>> +     r = crypt_convert(cc, &io->ctx, test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags));
>>>       if (r)
>>>               io->error = r;
>>>       crypt_finished = atomic_dec_and_test(&io->ctx.cc_pending);
>>> @@ -1971,7 +1977,7 @@ static void kcryptd_crypt_read_convert(struct dm_crypt_io *io)
>>>       crypt_convert_init(cc, &io->ctx, io->base_bio, io->base_bio,
>>>                          io->sector);
>>>
>>> -     r = crypt_convert(cc, &io->ctx);
>>> +     r = crypt_convert(cc, &io->ctx, test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags));
>>>       if (r)
>>>               io->error = r;
>>>
>>> @@ -2031,9 +2037,29 @@ static void kcryptd_crypt(struct work_struct *work)
>>>               kcryptd_crypt_write_convert(io);
>>>  }
>>>
>>> +static void kcryptd_crypt_tasklet(unsigned long work)
>>> +{
>>> +     kcryptd_crypt((struct work_struct *)work);
>>> +}
>>> +
>>>  static void kcryptd_queue_crypt(struct dm_crypt_io *io)
>>>  {
>>>       struct crypt_config *cc = io->cc;
>>> +     bool noworkqueue =
>>> +                     (bio_data_dir(io->base_bio) == READ && test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags)) ||
>>> +                     (bio_data_dir(io->base_bio) == WRITE && test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags));
>>
>> Since this variable is used only in the if statement bleow, why not used the
>> condition directly in that statement ?
>>
>>> +
>>> +     if (noworkqueue) {
>>> +             if (in_irq()) {
>>> +                     /* Crypto API's "skcipher_walk_first() refuses to work in hard IRQ context */
>>> +                     tasklet_init(&io->tasklet, kcryptd_crypt_tasklet, (unsigned long)&io->work);
>>> +                     tasklet_schedule(&io->tasklet);
>>> +                     return;
>>> +             }
>>> +
>>> +             kcryptd_crypt(&io->work);
>>> +             return;
>>> +     }
>>>
>>>       INIT_WORK(&io->work, kcryptd_crypt);
>>>       queue_work(cc->crypt_queue, &io->work);
>>> @@ -2838,7 +2864,7 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
>>>       struct crypt_config *cc = ti->private;
>>>       struct dm_arg_set as;
>>>       static const struct dm_arg _args[] = {
>>> -             {0, 6, "Invalid number of feature args"},
>>> +             {0, 8, "Invalid number of feature args"},
>>>       };
>>>       unsigned int opt_params, val;
>>>       const char *opt_string, *sval;
>>> @@ -2868,6 +2894,10 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
>>>
>>>               else if (!strcasecmp(opt_string, "submit_from_crypt_cpus"))
>>>                       set_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
>>> +             else if (!strcasecmp(opt_string, "no_read_workqueue"))
>>> +                     set_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags);
>>> +             else if (!strcasecmp(opt_string, "no_write_workqueue"))
>>> +                     set_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags);
>>>               else if (sscanf(opt_string, "integrity:%u:", &val) == 1) {
>>>                       if (val == 0 || val > MAX_TAG_SIZE) {
>>>                               ti->error = "Invalid integrity arguments";
>>> @@ -3196,6 +3226,8 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
>>>               num_feature_args += !!ti->num_discard_bios;
>>>               num_feature_args += test_bit(DM_CRYPT_SAME_CPU, &cc->flags);
>>>               num_feature_args += test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags);
>>> +             num_feature_args += test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags);
>>> +             num_feature_args += test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags);
>>>               num_feature_args += cc->sector_size != (1 << SECTOR_SHIFT);
>>>               num_feature_args += test_bit(CRYPT_IV_LARGE_SECTORS, &cc->cipher_flags);
>>>               if (cc->on_disk_tag_size)
>>> @@ -3208,6 +3240,10 @@ static void crypt_status(struct dm_target *ti, status_type_t type,
>>>                               DMEMIT(" same_cpu_crypt");
>>>                       if (test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags))
>>>                               DMEMIT(" submit_from_crypt_cpus");
>>> +                     if (test_bit(DM_CRYPT_NO_READ_WORKQUEUE, &cc->flags))
>>> +                             DMEMIT(" no_read_workqueue");
>>> +                     if (test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags))
>>> +                             DMEMIT(" no_write_workqueue");
>>>                       if (cc->on_disk_tag_size)
>>>                               DMEMIT(" integrity:%u:%s", cc->on_disk_tag_size, cc->cipher_auth);
>>>                       if (cc->sector_size != (1 << SECTOR_SHIFT))
>>> @@ -3320,7 +3356,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
>>>
>>>  static struct target_type crypt_target = {
>>>       .name   = "crypt",
>>> -     .version = {1, 21, 0},
>>> +     .version = {1, 22, 0},
>>>       .module = THIS_MODULE,
>>>       .ctr    = crypt_ctr,
>>>       .dtr    = crypt_dtr,
>>>
>>
>>
>> --
>> Damien Le Moal
>> Western Digital Research
> 


-- 
Damien Le Moal
Western Digital Research



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

