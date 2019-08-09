Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4342A88192
	for <lists+dm-devel@lfdr.de>; Fri,  9 Aug 2019 19:50:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8544DB2CD;
	Fri,  9 Aug 2019 17:49:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D19160BF3;
	Fri,  9 Aug 2019 17:49:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C68218005B9;
	Fri,  9 Aug 2019 17:49:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79HnUIh019694 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 13:49:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21E005EE1D; Fri,  9 Aug 2019 17:49:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C4D35B69A
	for <dm-devel@redhat.com>; Fri,  9 Aug 2019 17:49:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6CD6B307C82E
	for <dm-devel@redhat.com>; Fri,  9 Aug 2019 17:49:26 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c2so95762131wrm.8
	for <dm-devel@redhat.com>; Fri, 09 Aug 2019 10:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gPwm+r5WNS1IOxztbTU9nvDsGGWOUrwXuVfZcxKOapU=;
	b=VxyADs6UriQsKq84MWP+Ibx/F2XohR2o48Y/suR3NH22kPQFipGErhfNjeUPpqKBDl
	3h7qsCODSm/GvLEzUh/EdeRNgarW0ykAUFFV5glrPE5RU5KEEaXpgqXaiR3uxDMwbG1M
	C6ETbS0GnGRX872FElZmhRMVyvCcqpi3ZcsbV945anvS9tSxyjDNi1B7T6egbCRNFgHj
	SWaxE7xYgJZ3RLe5ieseNfxONleZ4jBtvv9DLARkT1gcsY53BGsGZiaXQC0Gc7goiNh4
	+Rcsm8ldF2PG9JrG6ckqCfxyZGm/PH3A6r9sP1/FlUKbAuJLhp+htWMZ71ZqRXhXdfxp
	CWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gPwm+r5WNS1IOxztbTU9nvDsGGWOUrwXuVfZcxKOapU=;
	b=FZ0BbNyJIuMfMsg2ILGM6i0KlXitLKYvUOwvIUEAL8MfjrAy2Q428tVKdsnYYVYm2T
	q8qIIYBlWBSk0MiZqaEZu65yryr1ViwcziepNPOnm08K2V4KDqXEhHMS1qBThqFqLU6/
	S+ks3V0j6bx/8UKY2FilFJovIloxEuHQvG73fIEn2hrP973PqDLb8qpWGAvYKs8ItIDg
	qP2q28PKIf61G7c1PG/M9Rhr1pvPynWcuEfZATM/YVLX9CXZ6koNB4vX2B6bZjCstNzx
	FooPBXPZYSu26jN+zlW4c9qiyCXXbYbU3rkbnWWky8PFX5kYeRuZx9kjZjJpiOCjaJTl
	gTqg==
X-Gm-Message-State: APjAAAUp7ZbR1uE5Z34I7B9aoD4YVLLK64wLOH9PU4OuyLScuH979C9a
	dmdAGXNDUzWhu0c5cT0raS/mXa4nOX35bPQH0ew0OQ==
X-Google-Smtp-Source: APXvYqyNsVff7t9wfsKx2DAt8Eagy8q0d67Jxnxp10Y0gV7LpZSL0gAy1sE0FDJziKN0JepQCO3sLlk1oza6NgzvGSc=
X-Received: by 2002:adf:aa09:: with SMTP id p9mr3597878wrd.174.1565372965031; 
	Fri, 09 Aug 2019 10:49:25 -0700 (PDT)
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
	<CAKv+Gu9hk=PGpsAWWOU61VrA3mVQd10LudA1qg0LbiX7DG9RjA@mail.gmail.com>
	<VI1PR0402MB3485F94AECC495F133F6B3D798D60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
In-Reply-To: <VI1PR0402MB3485F94AECC495F133F6B3D798D60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 9 Aug 2019 20:49:13 +0300
Message-ID: <CAKv+Gu-_WObNm+ySXDWjhqe2YPzajX83MofuF-WKPSdLg5t4Ew@mail.gmail.com>
To: Horia Geanta <horia.geanta@nxp.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 09 Aug 2019 17:49:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 09 Aug 2019 17:49:26 +0000 (UTC) for IP:'209.85.221.51'
	DOMAIN:'mail-wr1-f51.google.com' HELO:'mail-wr1-f51.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.51 mail-wr1-f51.google.com 209.85.221.51
	mail-wr1-f51.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 09 Aug 2019 17:50:02 +0000 (UTC)

On Fri, 9 Aug 2019 at 10:44, Horia Geanta <horia.geanta@nxp.com> wrote:
>
> On 8/9/2019 9:45 AM, Ard Biesheuvel wrote:
> > On Fri, 9 Aug 2019 at 05:48, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >>
> >> On Thu, Aug 08, 2019 at 06:01:49PM +0000, Horia Geanta wrote:
> >>>
> >>> -- >8 --
> >>>
> >>> Subject: [PATCH] crypto: testmgr - Add additional AES-XTS vectors for covering
> >>>  CTS (part II)
> >>
> >> Patchwork doesn't like it when you do this and it'll discard
> >> your patch.  To make it into patchwork you need to put the new
> >> Subject in the email headers.
> >>
> >
> > IMO, pretending that your XTS implementation is compliant by only
> I've never said that.
> Some parts are compliant, some are not.
>
> > providing test vectors with the last 8 bytes of IV cleared is not the
> > right fix for this issue. If you want to be compliant, you will need
> It's not a fix.
> It's adding test vectors which are not provided in the P1619 standard,
> where "data unit sequence number" is at most 5B.
>

Indeed. But I would prefer not to limit ourselves to 5 bytes of sector
numbers in the test vectors. However, we should obviously not add test
vectors that are known to cause breakages on hardware that works fine
in practice.

> > to provide a s/w fallback for these cases.
> >
> Yes, the plan is to:
>
> -add 16B IV support for caam versions supporting it - caam Era 9+,
> currently deployed in lx2160a and ls108a
>
> -remove current 8B IV support and add s/w fallback for affected caam versions
> I'd assume this could be done dynamically, i.e. depending on IV provided
> in the crypto request to use either the caam engine or s/w fallback.
>

Yes. If the IV received from the caller has bytes 8..15 cleared, you
use the limited XTS h/w implementation, otherwise you fall back to
xts(ecb-aes-caam..).

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
