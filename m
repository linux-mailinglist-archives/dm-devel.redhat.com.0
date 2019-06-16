Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3B476C7
	for <lists+dm-devel@lfdr.de>; Sun, 16 Jun 2019 22:44:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 742ED81F1B;
	Sun, 16 Jun 2019 20:44:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18D4A5F9D6;
	Sun, 16 Jun 2019 20:44:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DA3AC57E;
	Sun, 16 Jun 2019 20:44:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5GKiOnZ028086 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 16 Jun 2019 16:44:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E77B99F2E6; Sun, 16 Jun 2019 20:44:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2C561948D
	for <dm-devel@redhat.com>; Sun, 16 Jun 2019 20:44:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E077308FF30
	for <dm-devel@redhat.com>; Sun, 16 Jun 2019 20:44:21 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6B5DA20657;
	Sun, 16 Jun 2019 20:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560717860;
	bh=ERPegYNkzD1FcPth0R9F9JaoxJphp4IIppVtDXCAaNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZD6nfl7QbXsr+bn8m9kTTtdpdUoXBi0n15kPmSdKZAlCEOIRivM4FfR69m3zh2m18
	LPiET6joxh6wkELK/OQae09JQnGUC/78BNQoB2y1xsBTeG6YEMesv3ZOUxPiKWpNli
	0KVytrVhuGIvPn94jla5XNNePdj7jk3cHVog67/8=
Date: Sun, 16 Jun 2019 13:44:19 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190616204419.GE923@sol.localdomain>
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Sun, 16 Jun 2019 20:44:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Sun, 16 Jun 2019 20:44:21 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-fscrypt@vger.kernel.org,
	linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
	generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sun, 16 Jun 2019 20:44:56 +0000 (UTC)

[+Cc dm-devel and linux-fscrypt]

On Fri, Jun 14, 2019 at 10:34:01AM +0200, Ard Biesheuvel wrote:
> This series is presented as an RFC for a couple of reasons:
> - it is only build tested
> - it is unclear whether this is the right way to move away from the use of
>   bare ciphers in non-crypto code
> - we haven't really discussed whether moving away from the use of bare ciphers
>   in non-crypto code is a goal we agree on
> 
> This series creates an ESSIV shash template that takes a (cipher,hash) tuple,
> where the digest size of the hash must be a valid key length for the cipher.
> The setkey() operation takes the hash of the input key, and sets into the
> cipher as the encryption key. Digest operations accept input up to the
> block size of the cipher, and perform a single block encryption operation to
> produce the ESSIV output.
> 
> This matches what both users of ESSIV in the kernel do, and so it is proposed
> as a replacement for those, in patches #2 and #3.
> 
> As for the discussion: the code is untested, so it is presented for discussion
> only. I'd like to understand whether we agree that phasing out the bare cipher
> interface from non-crypto code is a good idea, and whether this approach is
> suitable for fscrypt and dm-crypt.
> 
> Remaining work:
> - wiring up some essiv(x,y) combinations into the testing framework. I wonder
>   if anything other than essiv(aes,sha256) makes sense.
> - testing - suggestions welcome on existing testing frameworks for dm-crypt
>   and/or fscrypt
> 
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Eric Biggers <ebiggers@google.com>
> 
> Ard Biesheuvel (3):
>   crypto: essiv - create a new shash template for IV generation
>   dm crypt: switch to essiv shash
>   fscrypt: switch to ESSIV shash
> 
>  crypto/Kconfig              |   3 +
>  crypto/Makefile             |   1 +
>  crypto/essiv.c              | 275 ++++++++++++++++++++
>  drivers/md/Kconfig          |   1 +
>  drivers/md/dm-crypt.c       | 137 ++--------
>  fs/crypto/Kconfig           |   1 +
>  fs/crypto/crypto.c          |  11 +-
>  fs/crypto/fscrypt_private.h |   4 +-
>  fs/crypto/keyinfo.c         |  64 +----
>  9 files changed, 321 insertions(+), 176 deletions(-)
>  create mode 100644 crypto/essiv.c

I agree that moving away from bare block ciphers is generally a good idea.  For
fscrypt I'm fine with moving ESSIV into the crypto API, though I'm not sure a
shash template is the best approach.  Did you also consider making it a skcipher
template so that users can do e.g. "essiv(cbc(aes),sha256,aes)"?  That would
simplify things much more on the fscrypt side, since then all the ESSIV-related
code would go away entirely except for changing the string "cbc(aes)" to
"essiv(cbc(aes),sha256,aes)".

Either way, for testing the fscrypt change, I recently added tests to xfstests
that verify the on-disk ciphertext in userspace, including for non-default modes
such as the AES-128-CBC-ESSIV in question.  So I'm not too worried about the
fscrypt encryption getting accidentally broken anymore.  If you want to run the
AES-128-CBC-ESSIV test yourself, you should be able to do it by following the
directions at
https://github.com/tytso/xfstests-bld/blob/master/Documentation/kvm-quickstart.md
and running 'kvm-xfstests -c ext4 generic/549'.

As for adding essiv to testmgr, sha256 and aes would be enough for fscrypt.
There aren't any plans to add more ESSIV settings to fscrypt, and
AES-128-CBC-ESSIV was only added in the first place because some people wanted
to use fscrypt on platforms with CBC hardware acceleration but not XTS.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
