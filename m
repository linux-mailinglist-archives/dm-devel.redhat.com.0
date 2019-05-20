Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9F22A06
	for <lists+dm-devel@lfdr.de>; Mon, 20 May 2019 04:44:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2767E1796;
	Mon, 20 May 2019 02:44:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 439815F7E5;
	Mon, 20 May 2019 02:44:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99DD61806B14;
	Mon, 20 May 2019 02:44:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4K2hxsh010794 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 May 2019 22:43:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49A7F4145; Mon, 20 May 2019 02:43:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4404B19CA8
	for <dm-devel@redhat.com>; Mon, 20 May 2019 02:43:56 +0000 (UTC)
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 719C33082AFF
	for <dm-devel@redhat.com>; Mon, 20 May 2019 02:43:56 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i10so20555294ite.0
	for <dm-devel@redhat.com>; Sun, 19 May 2019 19:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8Oz/YZayaErdzdzhKp0fyhCZgzFhmaZCIFKkjQCJwlc=;
	b=mLbts5Y3adqCCNOiBTBvLEF/D/VgYwgALLSOeLQSx8p8FyDSSJWEO5SOBOpdUY4oHF
	pzTft49wWnlzo+V9/gMcK5j2VXwSRb0rS8aUzseZ8l/T8DJHgeMM2V/vRZUQLEClutO5
	0OhAXfagAk0ZlFMd0dw+zbEz3VRRwMyRGe1P3MyprNgqbHdKpzzulM0mM4jaELXnGuVn
	v6f2fZ8DkIpVTNRIMZh/QYtxQB1fTHcgjCO3yDpDikXbR4Q4exHekEFITwHqpaATKgBR
	W75JUllIhs+tKXuZbtG82RRlMuGN1zOwwrlZKqIVx6z3uAIY/crrVSnd2mRtKe1+RW/t
	LNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Oz/YZayaErdzdzhKp0fyhCZgzFhmaZCIFKkjQCJwlc=;
	b=mzhaOyExiKa7ae7C+ZtEXVV97nV26YgP24jRgcIZxHn6MrXDE2HVTTFh4krsrsoKJs
	mgAm06dW6GAU5ruTutaQLez2s2RFwgTLy8/uLtw2YLIAV7VzACY7rvQyh4WGRb+XcB4t
	dTMoy3p1PaOVMFqMyUc9+s6jmDAEqC3rxZGk5EJbgGlRmnEX/B+19bKwvj0UD1Iil0Bx
	cO1ikcaS+QeZG+qaiVReu19Sm4CQl33p0ljo1Z5u+efOOvklfC/9zHEoj0t0CakxVBpC
	whfJwYWIe2be29PCTTSSTno2cBJtsEnkyal2Dhswkc5FAVr/QEpMCuTTLkRNPO/29M4p
	nOHg==
X-Gm-Message-State: APjAAAXN+c+N1YEoMljMHEp+j83M+r9chwMha9W7Dp9d2pubi3Ccr8Fg
	evxUbaAkXfYnSjR+rCTAhB2vZFXT1o9NpzAjBc8=
X-Google-Smtp-Source: APXvYqwX83EyMWnhZTroZgn/yFXpCshf1utCd63Zo5lr+tdPYblxILai87WFk5neVpwdrOXIgQWX0a0ubNLlqRZAiYQ=
X-Received: by 2002:a24:f983:: with SMTP id l125mr28527609ith.62.1558320235895;
	Sun, 19 May 2019 19:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<CAKM4Aez=eC96uyqJa+=Aom2M2eQnknQW_uY4v9NMVpROSiuKSg@mail.gmail.com>
	<CALJn8nME9NQGsSqLXHQPEizFfKUzxozfYy-2510MHyMPHRzhfw@mail.gmail.com>
In-Reply-To: <CALJn8nME9NQGsSqLXHQPEizFfKUzxozfYy-2510MHyMPHRzhfw@mail.gmail.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Mon, 20 May 2019 10:43:44 +0800
Message-ID: <CAKM4AeyJs8KUB3vi=GPDnb-yjED2oFYvn7O=CPNi3Er3orAbfg@mail.gmail.com>
To: "Guilherme G. Piccoli" <kernel@gpiccoli.net>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 20 May 2019 02:43:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Mon, 20 May 2019 02:43:56 +0000 (UTC) for IP:'209.85.166.194'
	DOMAIN:'mail-it1-f194.google.com'
	HELO:'mail-it1-f194.google.com' FROM:'renzhengeek@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.166.194 mail-it1-f194.google.com 209.85.166.194
	mail-it1-f194.google.com <renzhengeek@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	"Guilherme G. Piccoli" <gpiccoli@canonical.com>,
	stable@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH 1/2] block: Fix a NULL pointer dereference in
	generic_make_request()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 20 May 2019 02:44:35 +0000 (UTC)

Hi,

On Sat, 18 May 2019 at 00:17, Guilherme G. Piccoli <kernel@gpiccoli.net> wrote:
>
> On Fri, May 17, 2019 at 12:33 AM Eric Ren <renzhengeek@gmail.com> wrote:
> >
> > Hello,
> > [...]
> > Thanks for the bugfix. I also had a panic having very similar
> > calltrace below as this one,
> > when using devicemapper in container scenario and deleting many thin
> > snapshots by dmsetup
> > remove_all -f, meanwhile executing lvm command like vgs.
> >
> > After applied this one, my testing doesn't crash kernel any more for
> > one week.  Could the block
> > developers please give more feedback/priority on this one?
> >
>
> Thanks Eric, for the testing! I think you could send your Tested-by[0]
> tag, which could be added
> in the patch before merge. It's good to know the patch helped somebody
> and your testing improves
> confidence in the change.

Please consider Ming's comments and send patch v2, then feel free to add:
Tested-by: Eric Ren <renzhengeek@gmail.com>

Thanks!
Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
