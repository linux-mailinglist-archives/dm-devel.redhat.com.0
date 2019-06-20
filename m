Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD3A4D8BE
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 20:30:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E2FDD307D941;
	Thu, 20 Jun 2019 18:29:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E4715C1A1;
	Thu, 20 Jun 2019 18:29:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1C5A1806B0F;
	Thu, 20 Jun 2019 18:28:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KIRWrx028768 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 14:27:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8372C5C224; Thu, 20 Jun 2019 18:27:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EEA95C221
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 18:27:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3202D30C31A7
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 18:27:10 +0000 (UTC)
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 765BF20665;
	Thu, 20 Jun 2019 18:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561055229;
	bh=eMOLl0DcLSBYMu58BKMqYpLM96sUSYjdEOqgHR8GkUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ze7xvxmKDeulGb8SrJFzP470JWAhV0FOt7sxyxvg91DvU/QIBJvW918i/i2jUyL2T
	tuw0fZSduK7oCDpGwRfuWw9/XRy6vKr5ErO5v8nHFRTWMW5rpsrqVr2JA2yVN2Wmox
	75oBRUUHeuGl822CW8ASR1JPL2qSADcVBQBgI0n8=
Date: Thu, 20 Jun 2019 11:27:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190620182706.GA246122@gmail.com>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
	<20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
	<CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 20 Jun 2019 18:27:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 20 Jun 2019 18:27:12 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -1.308  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_HI,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v3 1/6] crypto: essiv - create wrapper
 template for ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 20 Jun 2019 18:30:10 +0000 (UTC)

On Thu, Jun 20, 2019 at 09:30:41AM +0200, Ard Biesheuvel wrote:
> On Thu, 20 Jun 2019 at 03:14, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > On Wed, Jun 19, 2019 at 06:04:17PM -0700, Eric Biggers wrote:
> > >
> > > > +#define ESSIV_IV_SIZE              sizeof(u64)     // IV size of the outer algo
> > > > +#define MAX_INNER_IV_SIZE  16              // max IV size of inner algo
> > >
> > > Why does the outer algorithm declare a smaller IV size?  Shouldn't it just be
> > > the same as the inner algorithm's?
> >
> > In general we allow outer algorithms to have distinct IV sizes
> > compared to the inner algorithm.  For example, rfc4106 has a
> > different IV size compared to gcm.
> >
> > In this case, the outer IV size is the block number so that's
> > presumably why 64 bits is sufficient.  Do you forsee a case where
> > we need 128-bit block numbers?
> >
> 
> Indeed, the whole point of this template is that it turns a 64-bit
> sector number into a n-bit IV, where n equals the block size of the
> essiv cipher, and its min/max keysize covers the digest size of the
> shash.
> 
> I don't think it makes sense to generalize this further, and if I
> understand the feedback from Herbert and Gilad correctly, it would
> even be better to define the input IV as a LE 64-bit counter
> explicitly, so we can auto increment it between sectors.
> 

I was understanding ESSIV at a more abstract level, where you pass in some IV
(which may or may not contain a sector number of some particular length and
endianness) and it encrypts it.

I see that both fscrypt and dm-crypt use the convention of a __le64 sector
number though, so it's probably reasonable to define the IV to be that.  A brief
comment explaining this might be helpful, though.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
