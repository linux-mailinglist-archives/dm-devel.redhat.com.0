Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 024874C86C
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 09:31:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E50EA316291E;
	Thu, 20 Jun 2019 07:31:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C79DE6013D;
	Thu, 20 Jun 2019 07:31:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E82191806B0E;
	Thu, 20 Jun 2019 07:31:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5K7Uwpb018601 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 03:30:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 84DB3100194A; Thu, 20 Jun 2019 07:30:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E2DE1001DC3
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 07:30:56 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AF623007401
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 07:30:55 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so312946iot.1
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 00:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OleUuoLJ/awB8gj1L9pb8+s5gnreN1ERy+tmQ30S79M=;
	b=lWtjdJMbHtOsAdidtW99iwblOZlLS7lxCFi7XVqidfsGH7qb6gFm1x0hpVEwGvkQTE
	5tDjTsctDn3ekC/PM5dU94f+GluSKlyWpw+2tFfWXPsqt7+tjWXTcX1dJw0lEVWkof4v
	q/DjDDZyP4UAIn9orVK4ykzsWhVqbI00cgiyENYTxVjzaJeh/SjuDVp+NSVMXVfZABb/
	J5AyKD6eEt8PVPDQvaaSAHU0DW2LxSyrANM513LYDUJb0UPwgnHhlps9GzQLPUxnrq8J
	pPFs15Q1UoAZ5/P0dWhYH4k8qRlnHusQLDrWanqHEeOdgW8c+Zmut7QSuLy7QFAn1rVE
	MwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OleUuoLJ/awB8gj1L9pb8+s5gnreN1ERy+tmQ30S79M=;
	b=lqhYx0adKZjRJlue5aIxotUj7V//qeA+9SG4/73PoJQJ9OllMym/LrzO7Ja2wcGj2J
	0M1VJItf2rxLJLeCESrnNbBCTFTwHKwqtURZTBRsK9SN/08xoBl8bSLmH1IywLXIyz52
	ePNzCZcGzfb/X7gSOvjGSEjxiBqkx7wCuc41oQbkRy/FacdzNLLAwXwiBQGfufL+/4Uc
	HpgcNA7AWNqKNeif2rl5ERiJo3s5YlRIRGySQDVOBCn42jLflJBoCXv7RjhNTdrs940Z
	ALLfGUUUZTAzwcVUVmvs4aTxuzV1P8wwv/9v6MUodk16nMaEFByzoVZJP+Mj9/bpBDYS
	nLvg==
X-Gm-Message-State: APjAAAXy0eX1ZhaWuyhjAuHJiqPnkKJyBjk/ZmCXX2ox2LDCRGls/CoS
	v7knnCj0t0OipUn6OoC/hfkmzCXAAaowxLRu5ILcZQ==
X-Google-Smtp-Source: APXvYqwSgQ+YlxCnDlNipKA4pfu+5Hf7BLz6A0G9Uf+9NCduJO3GV2r4HpYMlxNkkXOApFqe/S3lx05NWq74F7JQWKE=
X-Received: by 2002:a05:6602:98:: with SMTP id
	h24mr28401891iob.49.1561015854360; 
	Thu, 20 Jun 2019 00:30:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
	<20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
In-Reply-To: <20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 20 Jun 2019 09:30:41 +0200
Message-ID: <CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 20 Jun 2019 07:30:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Thu, 20 Jun 2019 07:30:55 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.67 mail-io1-f67.google.com 209.85.166.67
	mail-io1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: linux-fscrypt@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 20 Jun 2019 07:31:50 +0000 (UTC)

On Thu, 20 Jun 2019 at 03:14, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Wed, Jun 19, 2019 at 06:04:17PM -0700, Eric Biggers wrote:
> >
> > > +#define ESSIV_IV_SIZE              sizeof(u64)     // IV size of the outer algo
> > > +#define MAX_INNER_IV_SIZE  16              // max IV size of inner algo
> >
> > Why does the outer algorithm declare a smaller IV size?  Shouldn't it just be
> > the same as the inner algorithm's?
>
> In general we allow outer algorithms to have distinct IV sizes
> compared to the inner algorithm.  For example, rfc4106 has a
> different IV size compared to gcm.
>
> In this case, the outer IV size is the block number so that's
> presumably why 64 bits is sufficient.  Do you forsee a case where
> we need 128-bit block numbers?
>

Indeed, the whole point of this template is that it turns a 64-bit
sector number into a n-bit IV, where n equals the block size of the
essiv cipher, and its min/max keysize covers the digest size of the
shash.

I don't think it makes sense to generalize this further, and if I
understand the feedback from Herbert and Gilad correctly, it would
even be better to define the input IV as a LE 64-bit counter
explicitly, so we can auto increment it between sectors.

But that leaves the question how to convey the sector size to the
template. Gilad suggests

essiv(cbc(aes),aes,sha256,xxx)

where xxx is the sector size, and incoming requests whose cryptlen is
an exact multiple of the sector size will have their LE counter auto
incremented between sectors. Note that we could make it optional for
now, and default to 4k, but I will at least have to parse the argument
if it is present and reject values != 4096

Is this the right approach? Or are there better ways to convey this
information when instantiating the template?
Also, it seems to me that the dm-crypt and fscrypt layers would
require major surgery in order to take advantage of this.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
