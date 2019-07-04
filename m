Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB755FCD0
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 20:16:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4077566991;
	Thu,  4 Jul 2019 18:16:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35642D1CC;
	Thu,  4 Jul 2019 18:16:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60C311833002;
	Thu,  4 Jul 2019 18:16:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64ICEfa008392 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 14:12:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DA15183FD; Thu,  4 Jul 2019 18:12:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26FC0140FD
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 18:12:11 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 788CC307D913
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 18:12:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so7458041wrm.8
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 11:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HuXIZkfyY0YKTx8OmkeMIGwbQPTVHS93TtpteeaIkps=;
	b=QmVTcjyUXw4tXpkU1bev3Vj26bzENCgNWbq4YQH0Pfde/cH/tV1GhtJ27Z5ZnTrF+4
	FgHIzgEZ4TdtqVnO/F5fjQuWlP4zkmjUPSUFOFyGRXpniAOaEnPMkFhNxEEO4a0WlaL1
	ozkLBvUHW+22CcAEaYt4VCEPL7kYsoiNW/OFRY1deObtoGpSZWwEEIsN2NDNgyku9fe4
	WvSh+N6NUZgHuQf7DcD7q2RaM04N6hctbDndYfT9L9QYX7FYgfqMVvtIVg6CU4UWAy2R
	sHRj+JoyKwSLI02xBf3lhzE+LOxgnWE8zeaByF57CMShibrXY3Ur5eSN7NKCW2DTqYSy
	3YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HuXIZkfyY0YKTx8OmkeMIGwbQPTVHS93TtpteeaIkps=;
	b=pOfUSbT4MbrmSeZUC3n1aZPzBxJ1OY7m/wNmumDTJJdq/kIXhb/yIgm0q8Yjt77i8q
	nup2K3mqV9oNawxdNnzPfNgWKioWMazPIlOE6zmI1Pnf8pONZwKdGEAs3Fnp36MZWC1N
	6POEMtDljHEIbT1Wgrd+LwWCjXWw0N8VVHCM+MgwyQF9Ef/dDdqCuPtxLXG6UbKOzl6O
	w490JjmTPWSP78H3FxbDX7h11v699K4MnyCbH/CU80md6ci819eYOvz3El3yjDQs0NPt
	DBMaPk3X4lT4HsIznsrP5GkMy1R9V97K+m+rJMBX2GgpgyxBccEoGmJFSevsx5kzJpXC
	6e+Q==
X-Gm-Message-State: APjAAAVvhwNhLEAC8VQUB/qeY5jkRxz2CD/FQPpengFN6anlcq9rUYfu
	8lnMeQkgisbCljhFVdQljnqdTkVmSiYYthBztcwMvjjO3UY=
X-Google-Smtp-Source: APXvYqzXv6qxcF3YEfLRpSADQXr5sJEIbc/6mQ9clj7L+KSmVga+3xCLc3v7Ei8bOK8f29pQhVeP9qDTlztcV1LEq00=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr20466300wrw.169.1562263923058; 
	Thu, 04 Jul 2019 11:12:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190704131033.9919-1-gmazyland@gmail.com>
	<20190704131033.9919-3-gmazyland@gmail.com>
	<7a8d13ee-2d3f-5357-48c6-37f56d7eff07@gmail.com>
	<CAKv+Gu_c+OpOwrr0dSM=j=HiDpfM4sarq6u=6AXrU8jwLaEr-w@mail.gmail.com>
	<CAKv+Gu8a6cBQYsbYs8CDyGbhHx0E=+1SU7afqoy9Cs+K8PMfqA@mail.gmail.com>
	<4286b8f6-03b5-a8b4-4db2-35dda954e518@gmail.com>
In-Reply-To: <4286b8f6-03b5-a8b4-4db2-35dda954e518@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 4 Jul 2019 20:11:46 +0200
Message-ID: <CAKv+Gu_Nesqtz-xs0LkHYZ6HXrKkbJjq8dKL6Cnrk9ZsQ=T3jg@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 04 Jul 2019 18:12:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 04 Jul 2019 18:12:04 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.215  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [dm-devel] [PATCH 3/3] dm-crypt: Implement eboiv - encrypted
 byte-offset initialization vector.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 04 Jul 2019 18:16:53 +0000 (UTC)

On Thu, 4 Jul 2019 at 19:45, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 04/07/2019 16:30, Ard Biesheuvel wrote:
> > On Thu, 4 Jul 2019 at 16:28, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >>
> >> (+ Eric)
> >>
> >> On Thu, 4 Jul 2019 at 15:29, Milan Broz <gmazyland@gmail.com> wrote:
> >>>
> >>> Hi Herbert,
> >>>
> >>> I have a question about the crypto_cipher API in dm-crypt:
> >>>
> >>> We are apparently trying to deprecate cryto_cipher API (see the ESSIV patchset),
> >>> but I am not sure what API now should be used instead.
> >>>
> >>
> >> Not precisely - what I would like to do is to make the cipher part of
> >> the internal crypto API. The reason is that there are too many
> >> occurrences where non-trivial chaining modes have been cobbled
> >> together from the cipher API.
>
> Well, in the ESSIV case I understand there are two in-kernel users, so it makes
> perfect sense to use common crypto API implementation.
>
> For the rest, I perhaps still do not understand the reason to move this API
> to "internal only" state.
>
> (I am sure people will find an another way to to construct crazy things,
> even if they are forced to use skcipher API. 8-)
>

True

To be clear, making the cipher API internal only is something that I
am proposing but hasn't been widely discussed yet. So if you make a
good argument why it is a terrible idea, I'm sure it will be taken
into account.

The main issue is that the cipher API is suboptimal if you process
many blocks in sequence, since SIMD implementations will not be able
to amortize the cost of kernel_fpu_begin()/end(). This is something
that we might be able to fix in other ways (and a SIMD get/put
interface has already been proposed which looks suitable for this as
well) but that would still involve an API change for something that
isn't the correct abstraction in the first place in many cases. (There
are multiple implementations of ccm(aes) using cipher_encrypt_one() in
a loop, for instance, and these are not able to benefit from, e.g,
the accelerated implementation that I created for arm64, since it open
codes the CCM operations)

> >>> See the patch below - all we need is to one block encryption for IV.
> >>>
> >>> This algorithm makes sense only for FDE (old compatible Bitlocker devices),
> >>> I really do not want this to be shared in some crypto module...
> >>>
> >>> What API should I use here? Sync skcipher? Is the crypto_cipher API
> >>> really a problem in this case?
> >>>
> >>
> >> Are arbitrary ciphers supported? Or are you only interested in AES? In
> >> the former case, I'd suggest the sync skcipher API to instantiate
> >> "ecb(%s)", otherwise, use the upcoming AES library interface.
>
> For the Bitlocker compatibility, it is only AES in CBC mode, but we usually do
> not limit IV use in dmcrypt.

Why on earth would you implement eboiv for compatibility purposes, and
then allow it to be used in random other combinations? Pushing back on
the use of arbitrary cipher cocktails is one of the reasons I'd prefer
the cipher API to become crypto internal, since it is typically much
better to stick with recommended combinations that are known to be
secure/

> (We still need to solve the Bitlocker Elephant diffuser, but that's another issue.)
>
> > Actually, if CBC is the only supported mode, you could also use the
> > skcipher itself to encrypt a single block of input (just encrypt the
> > IV using CBC but with an IV of all zeroes)
>
> I can then use ECB skcipher directly (IOW use skcipher ecb(aes) for IV).
> (ECB mode must be present, because XTS is based on it anyway.)
>
> Why I am asking is that with sync skcipher it means allocation of request
> on stack - still more code than the patch I posted below.
>

That is a very good point, and something that I have been meaning to
bring up myself: ever since we switched from [a]blkciphers so
skciphers, we lost the ability to operate synchronously on virtual
addresses, like we still have with shashes (as opposed to ahashes)
today. AEADs suffer from the same limitation.

The thing is, while switching to the cipher API does work around that,
it is not a proper fix, and going forward, we should really address
the above limitation in a sane way.

> We can do that. But if the crypto_cipher API stays exported, I do not see any
> reason to write more complicated code.
>
> We (dmcrypt) are pretty sophisticated user of crypto API already :)
>

That is absolutely true.

In summary, I think implementing eboiv for arbitrary ciphers would be
a mistake, since it is a mode that is intended for compatibility.
However, if you do, I think going with the cipher API for now is fine,
since you are using it in a sane way (i.e., to encrypt a single block
of plaintext with an a priori unknown cipher). If it ever becomes an
internal-only crypto API, we'll propose something else by that time.




> >
> >
> >>> On 04/07/2019 15:10, Milan Broz wrote:
> >>>> This IV is used in some BitLocker devices with CBC encryption mode.
> >>>>
> >>>> NOTE: maybe we need to use another crypto API if the bare cipher
> >>>>       API is going to be deprecated.
> >>>>
> >>>> Signed-off-by: Milan Broz <gmazyland@gmail.com>
> >>>> ---
> >>>>  drivers/md/dm-crypt.c | 82 ++++++++++++++++++++++++++++++++++++++++++-
> >>>>  1 file changed, 81 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> >>>> index 96ead4492787..a5ffa1ac6a28 100644
> >>>> --- a/drivers/md/dm-crypt.c
> >>>> +++ b/drivers/md/dm-crypt.c
> >>>> @@ -120,6 +120,10 @@ struct iv_tcw_private {
> >>>>       u8 *whitening;
> >>>>  };
> >>>>
> >>>> +struct iv_eboiv_private {
> >>>> +     struct crypto_cipher *tfm;
> >>>> +};
> >>>> +
> >>>>  /*
> >>>>   * Crypt: maps a linear range of a block device
> >>>>   * and encrypts / decrypts at the same time.
> >>>> @@ -159,6 +163,7 @@ struct crypt_config {
> >>>>               struct iv_benbi_private benbi;
> >>>>               struct iv_lmk_private lmk;
> >>>>               struct iv_tcw_private tcw;
> >>>> +             struct iv_eboiv_private eboiv;
> >>>>       } iv_gen_private;
> >>>>       u64 iv_offset;
> >>>>       unsigned int iv_size;
> >>>> @@ -290,6 +295,10 @@ static struct crypto_aead *any_tfm_aead(struct crypt_config *cc)
> >>>>   *       is calculated from initial key, sector number and mixed using CRC32.
> >>>>   *       Note that this encryption scheme is vulnerable to watermarking attacks
> >>>>   *       and should be used for old compatible containers access only.
> >>>> + *
> >>>> + * eboiv: Encrypted byte-offset IV (used in Bitlocker in CBC mode)
> >>>> + *        The IV is encrypted little-endian byte-offset (with the same key
> >>>> + *        and cipher as the volume).
> >>>>   */
> >>>>
> >>>>  static int crypt_iv_plain_gen(struct crypt_config *cc, u8 *iv,
> >>>> @@ -838,6 +847,67 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
> >>>>       return 0;
> >>>>  }
> >>>>
> >>>> +static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
> >>>> +{
> >>>> +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> >>>> +
> >>>> +     crypto_free_cipher(eboiv->tfm);
> >>>> +     eboiv->tfm = NULL;
> >>>> +}
> >>>> +
> >>>> +static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
> >>>> +                         const char *opts)
> >>>> +{
> >>>> +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> >>>> +     struct crypto_cipher *tfm;
> >>>> +
> >>>> +     tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
> >>>> +     if (IS_ERR(tfm)) {
> >>>> +             ti->error = "Error allocating crypto tfm for EBOIV";
> >>>> +             return PTR_ERR(tfm);
> >>>> +     }
> >>>> +
> >>>> +     if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
> >>>> +             ti->error = "Block size of EBOIV cipher does "
> >>>> +                         "not match IV size of block cipher";
> >>>> +             crypto_free_cipher(tfm);
> >>>> +             return -EINVAL;
> >>>> +     }
> >>>> +
> >>>> +     eboiv->tfm = tfm;
> >>>> +     return 0;
> >>>> +}
> >>>> +
> >>>> +static int crypt_iv_eboiv_init(struct crypt_config *cc)
> >>>> +{
> >>>> +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> >>>> +     int err;
> >>>> +
> >>>> +     err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
> >>>> +     if (err)
> >>>> +             return err;
> >>>> +
> >>>> +     return 0;
> >>>> +}
> >>>> +
> >>>> +static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
> >>>> +{
> >>>> +     /* Called after cc->key is set to random key in crypt_wipe() */
> >>>> +     return crypt_iv_eboiv_init(cc);
> >>>> +}
> >>>> +
> >>>> +static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
> >>>> +                         struct dm_crypt_request *dmreq)
> >>>> +{
> >>>> +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> >>>> +
> >>>> +     memset(iv, 0, cc->iv_size);
> >>>> +     *(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
> >>>> +     crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
> >>>> +
> >>>> +     return 0;
> >>>> +}
> >>>> +
> >>>>  static const struct crypt_iv_operations crypt_iv_plain_ops = {
> >>>>       .generator = crypt_iv_plain_gen
> >>>>  };
> >>>> @@ -890,6 +960,14 @@ static struct crypt_iv_operations crypt_iv_random_ops = {
> >>>>       .generator = crypt_iv_random_gen
> >>>>  };
> >>>>
> >>>> +static struct crypt_iv_operations crypt_iv_eboiv_ops = {
> >>>> +     .ctr       = crypt_iv_eboiv_ctr,
> >>>> +     .dtr       = crypt_iv_eboiv_dtr,
> >>>> +     .init      = crypt_iv_eboiv_init,
> >>>> +     .wipe      = crypt_iv_eboiv_wipe,
> >>>> +     .generator = crypt_iv_eboiv_gen
> >>>> +};
> >>>> +
> >>>>  /*
> >>>>   * Integrity extensions
> >>>>   */
> >>>> @@ -2293,6 +2371,8 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
> >>>>               cc->iv_gen_ops = &crypt_iv_benbi_ops;
> >>>>       else if (strcmp(ivmode, "null") == 0)
> >>>>               cc->iv_gen_ops = &crypt_iv_null_ops;
> >>>> +     else if (strcmp(ivmode, "eboiv") == 0)
> >>>> +             cc->iv_gen_ops = &crypt_iv_eboiv_ops;
> >>>>       else if (strcmp(ivmode, "lmk") == 0) {
> >>>>               cc->iv_gen_ops = &crypt_iv_lmk_ops;
> >>>>               /*
> >>>> @@ -3093,7 +3173,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
> >>>>
> >>>>  static struct target_type crypt_target = {
> >>>>       .name   = "crypt",
> >>>> -     .version = {1, 18, 1},
> >>>> +     .version = {1, 19, 0},
> >>>>       .module = THIS_MODULE,
> >>>>       .ctr    = crypt_ctr,
> >>>>       .dtr    = crypt_dtr,
> >>>>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
