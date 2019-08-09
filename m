Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D1387257
	for <lists+dm-devel@lfdr.de>; Fri,  9 Aug 2019 08:45:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA0902F8BD7;
	Fri,  9 Aug 2019 06:45:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E260310016E8;
	Fri,  9 Aug 2019 06:45:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DAD22551C;
	Fri,  9 Aug 2019 06:45:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x796jaQn029523 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 02:45:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DB0F60605; Fri,  9 Aug 2019 06:45:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 582A660933
	for <dm-devel@redhat.com>; Fri,  9 Aug 2019 06:45:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25467C050DFF
	for <dm-devel@redhat.com>; Fri,  9 Aug 2019 06:45:33 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id m125so526216wmm.3
	for <dm-devel@redhat.com>; Thu, 08 Aug 2019 23:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xWrqNOfYZno97GmIwxnWHgVlCFr0X1VJsoxi85baUTo=;
	b=X0Uu/sVLM7AiBoeSAQz06Q+O1BcakPsg/XX2ifKUaVBGO3WoDMNR00AgsQFNFTYbbu
	nUxj3MjfgJKTy5Zzd2UIaWhRY9+NirLAZa7FxvFTuR5DLypQHU8NFH9dDa1zuxlmafoK
	cr2Eic+jxIWFmolugf272FJXTW+qIS1o13v2ScrKLXhGniy6g5RYRsUcF5SyDh9/2RAo
	LbYkQ16jBCU7Rtpj+kV9nIscE4/vxAc9+zaCoX5a2HzHjIpMbGKtPxY8URU2lHsNHXYI
	n9G8/A+kRJmvJE2FlUPMjaRM4RenTEZPVoUsl9T76RNRraIqlVdlfxULY7z9JRvePnxu
	Bsiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xWrqNOfYZno97GmIwxnWHgVlCFr0X1VJsoxi85baUTo=;
	b=EiPCloqXaZV8aEOEIsux7N7h6TwNG40cBQ7jHnO9PTOSjkBNHi6IteN3WGVjV1RCwi
	SkUSu2KCdvtp82hofX7iDYlO0HPT3udQh/2kc5ACcjO9OAFNxFCU7TJBoEs7DeLp4vr+
	5J5WrgPEZc/3NaP4olR/9uuD/xHixL5RBW7yBPcRjZoPlcExhpulGkvcRIkx+2tXWTD7
	fgbzZvfV0L3Wfqjdn3twnxWE6KuxumFYZ1sk6lBYOX3TUlPmMqJem5mjTH//3nmg4CuD
	MfGBtyiTSpAFekmah9YOhg4Yas06kaQ/Wn59UClWe+AognRr4E7TMNzYplNrJ7INRXIr
	cGcA==
X-Gm-Message-State: APjAAAXMOlTD5dT5kq8jwVq8wXxAMXnem1QaDA9s8lj/iRKsI37TumR/
	uieZW0T4JT69apwX7JgAQav71LYiNYVb0435aB5aqwcjvq8=
X-Google-Smtp-Source: APXvYqwhVO8fbnBnY0DLUc3HNgpvV+kPSb8nQdK5soptUT7qkD6/zTG9rnfkBGfT2Eu46Z6ioGLlZc2f2EH3sKFf9w4=
X-Received: by 2002:a05:600c:20c1:: with SMTP id
	y1mr9047480wmm.10.1565333131720; 
	Thu, 08 Aug 2019 23:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAKv+Gu9C2AEbb++W=QTVWbeA_88Fo57NcOwgU5R8HBvzFwXkJw@mail.gmail.com>
	<MN2PR20MB2973C378AE5674F9E3E29445CAC60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-8n_DoauycDQS_9zzRew1rTuPaLxHyg6xhXMmqEvMaCA@mail.gmail.com>
	<MN2PR20MB2973CAE4E9CFFE1F417B2509CAC10@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
	<MN2PR20MB29739591E1A3E54E7A8A8E18CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20f4832e-e3af-e3c2-d946-13bf8c367a60@nxp.com>
	<VI1PR0402MB34856F03FCE57AB62FC2257998D40@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB2973127E4C159A8F5CFDD0C9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB3485689B4B65C879BC1D137398D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190809024821.GA7186@gondor.apana.org.au>
In-Reply-To: <20190809024821.GA7186@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 9 Aug 2019 09:45:20 +0300
Message-ID: <CAKv+Gu9hk=PGpsAWWOU61VrA3mVQd10LudA1qg0LbiX7DG9RjA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 09 Aug 2019 06:45:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Fri, 09 Aug 2019 06:45:33 +0000 (UTC) for IP:'209.85.128.41'
	DOMAIN:'mail-wm1-f41.google.com' HELO:'mail-wm1-f41.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.41 mail-wm1-f41.google.com 209.85.128.41
	mail-wm1-f41.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Horia Geanta <horia.geanta@nxp.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 09 Aug 2019 06:45:49 +0000 (UTC)

On Fri, 9 Aug 2019 at 05:48, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Aug 08, 2019 at 06:01:49PM +0000, Horia Geanta wrote:
> >
> > -- >8 --
> >
> > Subject: [PATCH] crypto: testmgr - Add additional AES-XTS vectors for covering
> >  CTS (part II)
>
> Patchwork doesn't like it when you do this and it'll discard
> your patch.  To make it into patchwork you need to put the new
> Subject in the email headers.
>

IMO, pretending that your XTS implementation is compliant by only
providing test vectors with the last 8 bytes of IV cleared is not the
right fix for this issue. If you want to be compliant, you will need
to provide a s/w fallback for these cases.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
