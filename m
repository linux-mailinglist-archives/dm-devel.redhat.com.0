Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CD500A83DA
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 15:39:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94C8018B3D89;
	Wed,  4 Sep 2019 13:39:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F31985D9C9;
	Wed,  4 Sep 2019 13:39:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F383624F30;
	Wed,  4 Sep 2019 13:38:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x84Dcg4L024418 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 09:38:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B7E060167; Wed,  4 Sep 2019 13:38:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4753860166;
	Wed,  4 Sep 2019 13:38:37 +0000 (UTC)
Date: Wed, 4 Sep 2019 09:38:36 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Milan Broz <gmazyland@gmail.com>
Message-ID: <20190904133836.GA17836@redhat.com>
References: <20190819141738.1231-1-ard.biesheuvel@linaro.org>
	<20190819141738.1231-7-ard.biesheuvel@linaro.org>
	<20190903185827.GD13472@redhat.com>
	<403192f0-d1c4-0c60-5af1-7dee8516d629@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <403192f0-d1c4-0c60-5af1-7dee8516d629@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, dm-devel@redhat.com,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	linux-fscrypt@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v13 6/6] md: dm-crypt: omit parsing of the
 encapsulated cipher
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Wed, 04 Sep 2019 13:39:16 +0000 (UTC)

On Wed, Sep 04 2019 at  7:01am -0400,
Milan Broz <gmazyland@gmail.com> wrote:

> On 03/09/2019 20:58, Mike Snitzer wrote:
> > On Mon, Aug 19 2019 at 10:17am -0400,
> > Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> > 
> >> Only the ESSIV IV generation mode used to use cc->cipher so it could
> >> instantiate the bare cipher used to encrypt the IV. However, this is
> >> now taken care of by the ESSIV template, and so no users of cc->cipher
> >> remain. So remove it altogether.
> >>
> >> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > 
> > Acked-by: Mike Snitzer <snitzer@redhat.com>
> > 
> > Might be wise to bump the dm-crypt target's version number (from
> > {1, 19, 0} to {1, 20, 0}) at the end of this patch too though...
> 
> The function should be exactly the same, dependencies on needed modules are set.
> 
> In cryptsetup we always report dm target + kernel version,
> so we know that since version 5.4 it uses crypto API for ESSIV.
> I think version bump here is really not so important.
> 
> Just my two cents :)

Yes, that's fine.. I staged it for 5.4 yesterday without the version bump.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
