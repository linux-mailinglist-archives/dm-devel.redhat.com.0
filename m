Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6E397342
	for <lists+dm-devel@lfdr.de>; Wed, 21 Aug 2019 09:21:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DB6AC08EC01;
	Wed, 21 Aug 2019 07:21:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EB9057BB;
	Wed, 21 Aug 2019 07:21:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 32B31180085A;
	Wed, 21 Aug 2019 07:21:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7L7LLDt027408 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Aug 2019 03:21:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4CFF5C226; Wed, 21 Aug 2019 07:21:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-105.bne.redhat.com [10.64.54.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 898815C1D6;
	Wed, 21 Aug 2019 07:21:21 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
	helo=gondolin.hengli.com.au)
	by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1i0Kvm-0002hO-Tc; Wed, 21 Aug 2019 17:21:19 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1i0Kvd-0005uA-Ax; Wed, 21 Aug 2019 17:21:09 +1000
Date: Wed, 21 Aug 2019 17:21:09 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Milan Broz <gmazyland@gmail.com>
Message-ID: <20190821072109.GA22686@gondor.apana.org.au>
References: <CGME20190821064230epcas2p1ad7301f2b1331bcab3126e6e37c0e272@epcas2p1.samsung.com>
	<004201d557eb$9b0a4410$d11ecc30$@samsung.com>
	<cc484ef6-aacc-7864-0e6d-313b2e1c5d92@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc484ef6-aacc-7864-0e6d-313b2e1c5d92@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: 'Jens Axboe' <axboe@kernel.dk>, 'Jaehoon Chung' <jh80.chung@samsung.com>,
	'Ulf Hansson' <ulf.hansson@linaro.org>,
	"'Theodore Y. Ts'o'" <tytso@mit.edu>, 'Mike Snitzer' <snitzer@redhat.com>,
	"boojin.kim" <boojin.kim@samsung.com>,
	'Chao Yu' <chao@kernel.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org, 'Krzysztof Kozlowski' <krzk@kernel.org>,
	'Eric Biggers' <ebiggers@kernel.org>, dm-devel@redhat.com,
	'Kukjin Kim' <kgene@kernel.org>,
	'Andreas Dilger' <adilger.kernel@dilger.ca>,
	linux-crypto@vger.kernel.org, 'Jaegeuk Kim' <jaegeuk@kernel.org>,
	linux-fscrypt@vger.kernel.org, "'David S. Miller'" <davem@davemloft.net>,
	'Alasdair Kergon' <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 6/9] dm crypt: support diskcipher
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 21 Aug 2019 07:21:34 +0000 (UTC)

On Wed, Aug 21, 2019 at 09:13:36AM +0200, Milan Broz wrote:
>
> NACK.
> 
> The whole principle of dm-crypt target is that it NEVER EVER submits
> plaintext data down the stack in bio.
> 
> If you want to do some lower/higher layer encryption, use key management
> on a different layer.
> So here, just setup encryption for fs, do not stack it with dm-crypt.
> 
> Also, dm-crypt is software-independent solution
> (software-based full disk encryption), it must not depend on
> any underlying hardware.
> Hardware can be of course used used for acceleration, but then
> just implement proper crypto API module that accelerates particular cipher.

I agree.  Please take a look at the recent ESSIV patches on
linux-crypto and build multi-block operations on top of them
which can then be implemented by the hardware.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
