Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3EF4CEFF
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 15:37:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99FCC223885;
	Thu, 20 Jun 2019 13:37:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 132455C1A1;
	Thu, 20 Jun 2019 13:37:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEA2A1806B0F;
	Thu, 20 Jun 2019 13:36:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KDa6tJ030963 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 09:36:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 47C7B1001E80; Thu, 20 Jun 2019 13:36:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 422FA1001E77
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:36:01 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CB7E63D953
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:35:40 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id i10so915490iol.13
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 06:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BIDlsIvtATsL3hA5QAEsaHCyI03s2C5u03IcGdawceo=;
	b=o9alXZRUfb+rgrya2OuK7msSKBSLIOUcWsFtVHJICr1ID4KycIx7HeXphqKApgwkI9
	iw0YS5AdA0fd8S83GuH7isN4P46piJaZucQrcO8ruXW+kJlrMAlX7V3RGwNhUMBHwusy
	CKEO6hOXtvhXh8p3lY2HbCSH+vJY+2boyK2mzZ+5o73aqFC2CzeGmVxRVgquHcMCRso4
	CC/ckDTCWo5P1Lhs3Hz5hBXUExB8hoc+AiNI21xrnOnoXE8FK+7zsnyuEz5t7kEGTuGf
	wCKoKqoq4Tskwk2qh+Y240HsyZpWKtvGadkxkAFffQ3V/GkdyDzDIDUFJ1NZsm/n7kRv
	xq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BIDlsIvtATsL3hA5QAEsaHCyI03s2C5u03IcGdawceo=;
	b=XCoS6oeW/uSzLHpG1ZhU3eXpmK8olAV0VXc681mnwAG97MwjzMizrYMpMoamP4ye+H
	hQc2ouxCr5e3hdeo7S5A+35GQMk+W5sxck1/pYgT4pNBqpUT8xWiVSlU2Cde0zeDxZKI
	VYChey0FyPmXHomja0HbGa3XqnhpcbJ8KoQMUOnUl097AdSkb2Lp60548Vs9s72HIlb5
	dTSV2lACFJJ9IAUw6dJ/+zhCgFGiRsLBXOgutKMIIpjNyfQc12EMR16A/9safpkf+uOg
	9HdxvKwqOmTQm67M2MFxW8UyXQlZ13K1BdlstnpYKtyOLTvQ0E/ari/BqYRSx5KFOQ4J
	yKLQ==
X-Gm-Message-State: APjAAAVfJ5l7Asj0TC/Nl5Q4yivlUvT9HXDg+IyoQCYvkGHPaW5WVncw
	nO8X/XzDtPdPVatEqSWzzwHnBQDTwtcQPWtMKBTQUw==
X-Google-Smtp-Source: APXvYqxDNCT96WaC9Fy8q5f65kLAobnwxGYT6HTiFYdT15g7/FQXFMdaTJClLAv6we1Ldq6NmxiyxWHSpR02EcCMayA=
X-Received: by 2002:a02:9143:: with SMTP id b3mr48893jag.12.1561037740085;
	Thu, 20 Jun 2019 06:35:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
	<20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
	<CAKv+Gu-OwzmoYR5uymSNghEVc9xbkkt5C8MxAYA48UE=yBgb5g@mail.gmail.com>
	<20190620125339.gqup5623sw4xrsmi@gondor.apana.org.au>
	<CAKv+Gu_z3oMB-XBHRrNWpXNbSmb4CFC8VNn8s+8bOd-JjiakqQ@mail.gmail.com>
In-Reply-To: <CAKv+Gu_z3oMB-XBHRrNWpXNbSmb4CFC8VNn8s+8bOd-JjiakqQ@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 20 Jun 2019 15:35:28 +0200
Message-ID: <CAKv+Gu_7dQsJdb1Wmn2mzG7HFcfjF7ggGzUyPB5b_JR0ujHCrQ@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 20 Jun 2019 13:35:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Thu, 20 Jun 2019 13:35:40 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.19  (DKIM_INVALID, DKIM_SIGNED,
	RCVD_IN_DNSWL_NONE) 209.85.166.67 mail-io1-f67.google.com
	209.85.166.67 mail-io1-f67.google.com
	<ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 20 Jun 2019 13:37:37 +0000 (UTC)

On Thu, 20 Jun 2019 at 15:02, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Thu, 20 Jun 2019 at 14:53, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > On Thu, Jun 20, 2019 at 09:30:41AM +0200, Ard Biesheuvel wrote:
> > >
> > > Is this the right approach? Or are there better ways to convey this
> > > information when instantiating the template?
> > > Also, it seems to me that the dm-crypt and fscrypt layers would
> > > require major surgery in order to take advantage of this.
> >
> > Oh and you don't have to make dm-crypt use it from the start.  That
> > is, you can just make things simple by doing it one sector at a
> > time in the dm-crypt code even though the underlying essiv code
> > supports multiple sectors.
> >
> > Someone who cares about this is sure to come along and fix it later.
> >
>
> It also depend on how realistic it is that we will need to support
> arbitrary sector sizes in the future. I mean, if we decide today that
> essiv() uses an implicit sector size of 4k, we can always add
> essiv64k() later, rather than adding lots of complexity now that we
> are never going to use. Note that ESSIV is already more or less
> deprecated, so there is really no point in inventing these weird and
> wonderful things if we want people to move to XTS and plain IV
> generation instead.

Never mind, the sector size is already variable ...

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
