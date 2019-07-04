Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 270E35FCA0
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 19:47:53 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3EF283F42;
	Thu,  4 Jul 2019 17:47:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAF621001B3B;
	Thu,  4 Jul 2019 17:47:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C23B64EBC8;
	Thu,  4 Jul 2019 17:47:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64Hk6iJ003917 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 13:46:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 158A717A73; Thu,  4 Jul 2019 17:46:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E81C608CA
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 17:46:03 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6623A3082AC3
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 17:45:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n4so7444679wrs.3
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3nRBrnBKl48XJ4HetTkVACHbkJVQ5SGg8j9fWK7a8bw=;
	b=JNMlUM3AVJWIGaC/lhtZyP7AxqEoFoiChSyMM2+66KKPTtoIflNK2ka7KWAOgPPLgA
	jj5Gykg+cTNo5xuu3cQ7P3bfyFRAEfIqIgckXIlyKe13aGo28MZ6Xmx0YET7bFYlm4fJ
	+KFLyp1Jj690JG4hi9SOnqlZ9TLeVKJ/HwaZqLZkx56QPLFJ0Gol7EeRsCmNNdD2lS0s
	z0SUVGfcjIvuBIohHWBppUQGlsWyvuedgj4zg5/WJUh+IYyODe2tENtXx/e4nhURHHkI
	K+0xdnod8IGnH52xXM4kTXLqUKoySMuR7LSVlCHuAbx1wmpBbACrrSGCsm6qE7oOCHmU
	yjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3nRBrnBKl48XJ4HetTkVACHbkJVQ5SGg8j9fWK7a8bw=;
	b=M0LRIS1K9Zuw3fJsafgFl4YTMrzvbKFtIOXgaR8WNIU5RLMiGzgabdeHInhBFGdI56
	NyqqQia+nHjnrTxtlkX9k+dlOQM9LFFMr/BUKwrFCG8uxTiEVs/5o441q9oOR2LVkydu
	kSorq4uQoHmrVZ286HyxpF7JhynVXNE2me6nTu7xlDUfMbWz/YQ6RudJaAiQ/It9wTNj
	AYiPcaseaoU8gR8S2+dt2wlD7H1skavBi5AiY32m2iTECkJXiakHOKdf0AzvEsTMyZyn
	yibowVJyWFssoI8TEMXXzQNJnikL4o8+r+26kPic+u5BBc3d5bKCUNQw4w7DhN+BOKh8
	GXrg==
X-Gm-Message-State: APjAAAXwMSDIOTKHYEvNEj9WKPseyXfO9Ua9d+5AwYVWwIpAG5BjgOfo
	vg1M2yF94fa6RjSLFxEoFTU=
X-Google-Smtp-Source: APXvYqw7kHPlE5Ynevtrcl7U9CAMC+4Lw3aJ85LSyfkjHyeQG9l5cFBG244cOB/CTSzPpr+hWcKEFQ==
X-Received: by 2002:adf:e442:: with SMTP id t2mr36130520wrm.286.1562262350928; 
	Thu, 04 Jul 2019 10:45:50 -0700 (PDT)
Received: from [192.168.8.100] (37-48-34-161.nat.epc.tmcz.cz. [37.48.34.161])
	by smtp.gmail.com with ESMTPSA id
	c1sm9823972wrh.1.2019.07.04.10.45.49
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jul 2019 10:45:50 -0700 (PDT)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Eric Biggers <ebiggers@google.com>
References: <20190704131033.9919-1-gmazyland@gmail.com>
	<20190704131033.9919-3-gmazyland@gmail.com>
	<7a8d13ee-2d3f-5357-48c6-37f56d7eff07@gmail.com>
	<CAKv+Gu_c+OpOwrr0dSM=j=HiDpfM4sarq6u=6AXrU8jwLaEr-w@mail.gmail.com>
	<CAKv+Gu8a6cBQYsbYs8CDyGbhHx0E=+1SU7afqoy9Cs+K8PMfqA@mail.gmail.com>
From: Milan Broz <gmazyland@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <4286b8f6-03b5-a8b4-4db2-35dda954e518@gmail.com>
Date: Thu, 4 Jul 2019 19:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8a6cBQYsbYs8CDyGbhHx0E=+1SU7afqoy9Cs+K8PMfqA@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 04 Jul 2019 17:45:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Thu, 04 Jul 2019 17:45:52 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'gmazyland@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.214  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <gmazyland@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 04 Jul 2019 17:47:51 +0000 (UTC)

On 04/07/2019 16:30, Ard Biesheuvel wrote:
> On Thu, 4 Jul 2019 at 16:28, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>>
>> (+ Eric)
>>
>> On Thu, 4 Jul 2019 at 15:29, Milan Broz <gmazyland@gmail.com> wrote:
>>>
>>> Hi Herbert,
>>>
>>> I have a question about the crypto_cipher API in dm-crypt:
>>>
>>> We are apparently trying to deprecate cryto_cipher API (see the ESSIV patchset),
>>> but I am not sure what API now should be used instead.
>>>
>>
>> Not precisely - what I would like to do is to make the cipher part of
>> the internal crypto API. The reason is that there are too many
>> occurrences where non-trivial chaining modes have been cobbled
>> together from the cipher API.

Well, in the ESSIV case I understand there are two in-kernel users, so it makes
perfect sense to use common crypto API implementation.

For the rest, I perhaps still do not understand the reason to move this API
to "internal only" state.

(I am sure people will find an another way to to construct crazy things,
even if they are forced to use skcipher API. 8-)

>>> See the patch below - all we need is to one block encryption for IV.
>>>
>>> This algorithm makes sense only for FDE (old compatible Bitlocker devices),
>>> I really do not want this to be shared in some crypto module...
>>>
>>> What API should I use here? Sync skcipher? Is the crypto_cipher API
>>> really a problem in this case?
>>>
>>
>> Are arbitrary ciphers supported? Or are you only interested in AES? In
>> the former case, I'd suggest the sync skcipher API to instantiate
>> "ecb(%s)", otherwise, use the upcoming AES library interface.

For the Bitlocker compatibility, it is only AES in CBC mode, but we usually do
not limit IV use in dmcrypt.
(We still need to solve the Bitlocker Elephant diffuser, but that's another issue.)

> Actually, if CBC is the only supported mode, you could also use the
> skcipher itself to encrypt a single block of input (just encrypt the
> IV using CBC but with an IV of all zeroes)

I can then use ECB skcipher directly (IOW use skcipher ecb(aes) for IV).
(ECB mode must be present, because XTS is based on it anyway.)

Why I am asking is that with sync skcipher it means allocation of request
on stack - still more code than the patch I posted below.

We can do that. But if the crypto_cipher API stays exported, I do not see any
reason to write more complicated code.

We (dmcrypt) are pretty sophisticated user of crypto API already :)

Thanks,
Milan

> 
> 
>>> On 04/07/2019 15:10, Milan Broz wrote:
>>>> This IV is used in some BitLocker devices with CBC encryption mode.
>>>>
>>>> NOTE: maybe we need to use another crypto API if the bare cipher
>>>>       API is going to be deprecated.
>>>>
>>>> Signed-off-by: Milan Broz <gmazyland@gmail.com>
>>>> ---
>>>>  drivers/md/dm-crypt.c | 82 ++++++++++++++++++++++++++++++++++++++++++-
>>>>  1 file changed, 81 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
>>>> index 96ead4492787..a5ffa1ac6a28 100644
>>>> --- a/drivers/md/dm-crypt.c
>>>> +++ b/drivers/md/dm-crypt.c
>>>> @@ -120,6 +120,10 @@ struct iv_tcw_private {
>>>>       u8 *whitening;
>>>>  };
>>>>
>>>> +struct iv_eboiv_private {
>>>> +     struct crypto_cipher *tfm;
>>>> +};
>>>> +
>>>>  /*
>>>>   * Crypt: maps a linear range of a block device
>>>>   * and encrypts / decrypts at the same time.
>>>> @@ -159,6 +163,7 @@ struct crypt_config {
>>>>               struct iv_benbi_private benbi;
>>>>               struct iv_lmk_private lmk;
>>>>               struct iv_tcw_private tcw;
>>>> +             struct iv_eboiv_private eboiv;
>>>>       } iv_gen_private;
>>>>       u64 iv_offset;
>>>>       unsigned int iv_size;
>>>> @@ -290,6 +295,10 @@ static struct crypto_aead *any_tfm_aead(struct crypt_config *cc)
>>>>   *       is calculated from initial key, sector number and mixed using CRC32.
>>>>   *       Note that this encryption scheme is vulnerable to watermarking attacks
>>>>   *       and should be used for old compatible containers access only.
>>>> + *
>>>> + * eboiv: Encrypted byte-offset IV (used in Bitlocker in CBC mode)
>>>> + *        The IV is encrypted little-endian byte-offset (with the same key
>>>> + *        and cipher as the volume).
>>>>   */
>>>>
>>>>  static int crypt_iv_plain_gen(struct crypt_config *cc, u8 *iv,
>>>> @@ -838,6 +847,67 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
>>>>       return 0;
>>>>  }
>>>>
>>>> +static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
>>>> +{
>>>> +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
>>>> +
>>>> +     crypto_free_cipher(eboiv->tfm);
>>>> +     eboiv->tfm = NULL;
>>>> +}
>>>> +
>>>> +static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
>>>> +                         const char *opts)
>>>> +{
>>>> +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
>>>> +     struct crypto_cipher *tfm;
>>>> +
>>>> +     tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
>>>> +     if (IS_ERR(tfm)) {
>>>> +             ti->error = "Error allocating crypto tfm for EBOIV";
>>>> +             return PTR_ERR(tfm);
>>>> +     }
>>>> +
>>>> +     if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
>>>> +             ti->error = "Block size of EBOIV cipher does "
>>>> +                         "not match IV size of block cipher";
>>>> +             crypto_free_cipher(tfm);
>>>> +             return -EINVAL;
>>>> +     }
>>>> +
>>>> +     eboiv->tfm = tfm;
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int crypt_iv_eboiv_init(struct crypt_config *cc)
>>>> +{
>>>> +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
>>>> +     int err;
>>>> +
>>>> +     err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
>>>> +     if (err)
>>>> +             return err;
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>> +static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
>>>> +{
>>>> +     /* Called after cc->key is set to random key in crypt_wipe() */
>>>> +     return crypt_iv_eboiv_init(cc);
>>>> +}
>>>> +
>>>> +static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
>>>> +                         struct dm_crypt_request *dmreq)
>>>> +{
>>>> +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
>>>> +
>>>> +     memset(iv, 0, cc->iv_size);
>>>> +     *(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
>>>> +     crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
>>>> +
>>>> +     return 0;
>>>> +}
>>>> +
>>>>  static const struct crypt_iv_operations crypt_iv_plain_ops = {
>>>>       .generator = crypt_iv_plain_gen
>>>>  };
>>>> @@ -890,6 +960,14 @@ static struct crypt_iv_operations crypt_iv_random_ops = {
>>>>       .generator = crypt_iv_random_gen
>>>>  };
>>>>
>>>> +static struct crypt_iv_operations crypt_iv_eboiv_ops = {
>>>> +     .ctr       = crypt_iv_eboiv_ctr,
>>>> +     .dtr       = crypt_iv_eboiv_dtr,
>>>> +     .init      = crypt_iv_eboiv_init,
>>>> +     .wipe      = crypt_iv_eboiv_wipe,
>>>> +     .generator = crypt_iv_eboiv_gen
>>>> +};
>>>> +
>>>>  /*
>>>>   * Integrity extensions
>>>>   */
>>>> @@ -2293,6 +2371,8 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
>>>>               cc->iv_gen_ops = &crypt_iv_benbi_ops;
>>>>       else if (strcmp(ivmode, "null") == 0)
>>>>               cc->iv_gen_ops = &crypt_iv_null_ops;
>>>> +     else if (strcmp(ivmode, "eboiv") == 0)
>>>> +             cc->iv_gen_ops = &crypt_iv_eboiv_ops;
>>>>       else if (strcmp(ivmode, "lmk") == 0) {
>>>>               cc->iv_gen_ops = &crypt_iv_lmk_ops;
>>>>               /*
>>>> @@ -3093,7 +3173,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
>>>>
>>>>  static struct target_type crypt_target = {
>>>>       .name   = "crypt",
>>>> -     .version = {1, 18, 1},
>>>> +     .version = {1, 19, 0},
>>>>       .module = THIS_MODULE,
>>>>       .ctr    = crypt_ctr,
>>>>       .dtr    = crypt_dtr,
>>>>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
