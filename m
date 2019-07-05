Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DC95FFA5
	for <lists+dm-devel@lfdr.de>; Fri,  5 Jul 2019 05:09:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92DF93680B;
	Fri,  5 Jul 2019 03:09:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3605E891B9;
	Fri,  5 Jul 2019 03:09:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A51D24EBC5;
	Fri,  5 Jul 2019 03:08:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6538dRG004165 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 23:08:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 035FC1001B04; Fri,  5 Jul 2019 03:08:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from deadmen.hmeau.com (ovpn-12-61.pek2.redhat.com [10.72.12.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD6341001938
	for <dm-devel@redhat.com>; Fri,  5 Jul 2019 03:08:36 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hjEaM-0000wR-V8; Fri, 05 Jul 2019 11:08:30 +0800
Received: from herbert by gondobar with local (Exim 4.89)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hjEaJ-0002dk-BM; Fri, 05 Jul 2019 11:08:27 +0800
Date: Fri, 5 Jul 2019 11:08:27 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190705030827.k6f7hnhxjsoxdj6b@gondor.apana.org.au>
References: <20190704131033.9919-1-gmazyland@gmail.com>
	<20190704131033.9919-3-gmazyland@gmail.com>
	<7a8d13ee-2d3f-5357-48c6-37f56d7eff07@gmail.com>
	<CAKv+Gu_c+OpOwrr0dSM=j=HiDpfM4sarq6u=6AXrU8jwLaEr-w@mail.gmail.com>
	<CAKv+Gu8a6cBQYsbYs8CDyGbhHx0E=+1SU7afqoy9Cs+K8PMfqA@mail.gmail.com>
	<4286b8f6-03b5-a8b4-4db2-35dda954e518@gmail.com>
	<CAKv+Gu_Nesqtz-xs0LkHYZ6HXrKkbJjq8dKL6Cnrk9ZsQ=T3jg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_Nesqtz-xs0LkHYZ6HXrKkbJjq8dKL6Cnrk9ZsQ=T3jg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Eric Biggers <ebiggers@google.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 05 Jul 2019 03:09:07 +0000 (UTC)

On Thu, Jul 04, 2019 at 08:11:46PM +0200, Ard Biesheuvel wrote:
> 
> To be clear, making the cipher API internal only is something that I
> am proposing but hasn't been widely discussed yet. So if you make a
> good argument why it is a terrible idea, I'm sure it will be taken
> into account.
> 
> The main issue is that the cipher API is suboptimal if you process
> many blocks in sequence, since SIMD implementations will not be able
> to amortize the cost of kernel_fpu_begin()/end(). This is something
> that we might be able to fix in other ways (and a SIMD get/put
> interface has already been proposed which looks suitable for this as
> well) but that would still involve an API change for something that
> isn't the correct abstraction in the first place in many cases. (There
> are multiple implementations of ccm(aes) using cipher_encrypt_one() in
> a loop, for instance, and these are not able to benefit from, e.g,
> the accelerated implementation that I created for arm64, since it open
> codes the CCM operations)

I agree with what you guys have concluded so far.  But I do have
something I want to say about eboiv's implementation itself.

AFAICS this is using the same key as the actual data.  So why
don't you combine it with the actual data when encrypting/decrypting?

That is, add a block at the front of the actual data containing
the little-endian byte offset and then use an IV of zero.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
