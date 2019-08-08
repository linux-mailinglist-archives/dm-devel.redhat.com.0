Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9785CEB
	for <lists+dm-devel@lfdr.de>; Thu,  8 Aug 2019 10:31:44 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C086C12AC9;
	Thu,  8 Aug 2019 08:31:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32EE25D9D3;
	Thu,  8 Aug 2019 08:31:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC22318089C8;
	Thu,  8 Aug 2019 08:31:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x788VCFl018997 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 8 Aug 2019 04:31:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 732641D6; Thu,  8 Aug 2019 08:31:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC8135D9D3;
	Thu,  8 Aug 2019 08:31:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D018B2E95A5;
	Thu,  8 Aug 2019 08:31:01 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EA236214C6;
	Thu,  8 Aug 2019 08:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565253061;
	bh=5ESMyMBNu6p05v5ED3QRTCllbzhyiTHzmWVYmG71cxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N3ULtNqvBu60Tv9ro9tXW0UY6SDj9hj3GqVfecTVKX4UP8lRD66ng8u147qkARZDb
	rJzuWmSYrzVvFv9VV4gBSGDhzwHkU++GMZgW1WvboalMp6d3cpHnMOxyLj7D8oBCvd
	WJWei+akZWXQhxbXg7B1tjqKzYD31j/gRugPhv5M=
Date: Thu, 8 Aug 2019 01:30:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
Message-ID: <20190808083059.GB5319@sol.localdomain>
Mail-Followup-To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"gmazyland@gmail.com" <gmazyland@gmail.com>
References: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
	<MN2PR20MB297336108DF89337DDEEE2F6CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu_jFW26boEhpnAZg9sjWWZf60FXSWuSqNvC5FJiL7EVSA@mail.gmail.com>
	<MN2PR20MB2973A02FC4D6F1D11BA80792CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu8fgg=gt4LSnCfShnf0-PZ=B1TNwM3zdQr+V6hkozgDOA@mail.gmail.com>
	<MN2PR20MB29733EEF59CCD754256D5621CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR20MB29733EEF59CCD754256D5621CAD40@MN2PR20MB2973.namprd20.prod.outlook.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 08 Aug 2019 08:31:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Thu, 08 Aug 2019 08:31:02 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"gmazyland@gmail.com" <gmazyland@gmail.com>,
	"agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2] md/dm-crypt - reuse eboiv skcipher
 for IV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 08 Aug 2019 08:31:42 +0000 (UTC)

On Wed, Aug 07, 2019 at 04:14:22PM +0000, Pascal Van Leeuwen wrote:
> > > > In your case, we are not dealing with known plaintext attacks,
> > > >
> > > Since this is XTS, which is used for disk encryption, I would argue
> > > we do! For the tweak encryption, the sector number is known plaintext,
> > > same as for EBOIV. Also, you may be able to control data being written
> > > to the disk encrypted, either directly or indirectly.
> > > OK, part of the data into the CTS encryption will be previous ciphertext,
> > > but that may be just 1 byte with the rest being the known plaintext.
> > >
> > 
> > The tweak encryption uses a dedicated key, so leaking it does not have
> > the same impact as it does in the EBOIV case. 
> >
> Well ... yes and no. The spec defines them as seperately controllable -
> deviating from the original XEX definition - but in most practicle use cases 
> I've seen, the same key is used for both, as having 2 keys just increases 
> key  storage requirements and does not actually improve effective security 
> (of the algorithm itself, implementation peculiarities like this one aside 
> :-), as  XEX has been proven secure using a single key. And the security 
> proof for XTS actually builds on that while using 2 keys deviates from it.
> 

This is a common misconception.  Actually, XTS needs 2 distinct keys to be a
CCA-secure tweakable block cipher, due to another subtle difference from XEX:
XEX (by which I really mean "XEX[E,2]") builds the sequence of masks starting
with x^1, while XTS starts with x^0.  If only 1 key is used, the inclusion of
the 0th power in XTS allows the attack described in Section 6 of the XEX paper
(https://web.cs.ucdavis.edu/~rogaway/papers/offsets.pdf).

Of course, it's debatable what this means *in practice* to the usual XTS use
cases like disk encryption, for which CCA security may not be critical...  But
technically, single-key XTS isn't secure under as strong an attack model as XEX.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
