Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1A15F9A
	for <lists+dm-devel@lfdr.de>; Tue,  7 May 2019 10:42:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B384A3097083;
	Tue,  7 May 2019 08:42:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8891E64030;
	Tue,  7 May 2019 08:42:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CE3018089CC;
	Tue,  7 May 2019 08:42:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x46L7a5k001471 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 May 2019 17:07:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90C9A17A70; Mon,  6 May 2019 21:07:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 276986085B;
	Mon,  6 May 2019 21:07:29 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B50A0356E4;
	Mon,  6 May 2019 21:07:28 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id w25so2753515qkj.11;
	Mon, 06 May 2019 14:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4ndijvnNkt+c4ltTY2hyx/k7eCwa3nQG1K0KFz8eGCo=;
	b=JAHDSRCO6ityOJT6r/V3YG3CEWoALP5vVAl7YUsywrn7yNhxz3yPvabEMNsFojl17Z
	oYHQxvRY/w+V+OWH0hXUXcjrd+xNQvMif+q9dp/4rml5lzR9CwvnrhlecvAfqBp8HLpu
	RT7rQIf54ftUCcF41NCXUe+bKM4rpU3c+WV1vUAeSdwnsdh8NVLhrox1T1zRLujcsEiC
	zkqh1aBtlHmwR8/DMXYtU1SPEQP0kPvfNB2KPMT/NGsDh1exofQ+Wd9pYUaUn9CadJVe
	36k7EGEE6XE3w9OSafxCIqgo0zZLLl3zxS0gYAoqA2/ClGduUhcn3ep4GcZnaH2nk4Js
	LZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4ndijvnNkt+c4ltTY2hyx/k7eCwa3nQG1K0KFz8eGCo=;
	b=uhPE9hxeYQ5Uhi9rJhfvqY93cYi/BQ2v+rJq39Lxu5B0DayCpMXRScvz0kh4cf9jkb
	Ad8pepi8KCUuirNz6ivFZuXc5ncp9DD5dsU6Q89yitT2DPNW5Rrm9mcnbzsrYkOH7xqM
	SfiwfzCFpRpEvtIR5s7stdOAnDk/z1ixXqSbr4sEFVOW7eFCH4mWrWdcpoICu7uqtYo6
	alfrFIKpKg6flxcFk4haXJTwk+KXkp04JwJyKAXzL0r5Q8Y6S/DzIiSvO+uJkvwJGkAb
	Bx+B9Un63BoVRewLz+XFy0BhM7992PCHBAnDeIMFa2A1LNwiGkeUNNYl+DeIOvsspitn
	Z8wQ==
X-Gm-Message-State: APjAAAVfGAX20F82DsKTR0PeWvqo19YYL1f/T90DkFzMzTcAiPbKtvwc
	L3LtpaqkC36IqQtgq1HSwjzRIwYiGvOW2RlblUbu/Q==
X-Google-Smtp-Source: APXvYqy0cewLmOJ/voV9XvczblnnlIzNNvgjOehbgCWnmm79W69Rbb0K6eoBkS/uoxVXEVkLB/YMPNpGYFmWMBlj73o=
X-Received: by 2002:a05:620a:1423:: with SMTP id
	k3mr20774846qkj.120.1557176847994; 
	Mon, 06 May 2019 14:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<20190430223722.20845-2-gpiccoli@canonical.com>
	<CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
	<c8721ba3-5d38-7906-5049-e2b16e967ecf@canonical.com>
In-Reply-To: <c8721ba3-5d38-7906-5049-e2b16e967ecf@canonical.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Mon, 6 May 2019 17:07:16 -0400
Message-ID: <CAPhsuW6ahmkUhCgns=9WHPXSvYefB0Gmr1oB7gdZiD86sKyHFg@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 06 May 2019 21:07:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Mon, 06 May 2019 21:07:28 +0000 (UTC) for IP:'209.85.222.196'
	DOMAIN:'mail-qk1-f196.google.com'
	HELO:'mail-qk1-f196.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.139  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,
	SPF_PASS) 209.85.222.196 mail-qk1-f196.google.com 209.85.222.196
	mail-qk1-f196.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 07 May 2019 04:42:14 -0400
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	kernel@gpiccoli.net, stable@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH 2/2] md/raid0: Do not bypass blocking queue
 entered for raid0 bios
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 07 May 2019 08:42:38 +0000 (UTC)

On Mon, May 6, 2019 at 2:48 PM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> On 06/05/2019 13:50, Song Liu wrote:
> > [...]
> > IIUC, we need this for all raid types. Is it possible to fix that in md.c so
> > all types get the fix?
> >
> > Thanks,
> > Song
> >
>
> Hi Song, thanks again for reviewing my code and provide input, much
> appreciated!
>
> I understand this could in theory affects all the RAID levels, but in
> practice I don't think it'll happen. RAID0 is the only "blind" mode of
> RAID, in the sense it's the only one that doesn't care at all with
> failures. In fact, this was the origin of my other thread [0], regarding
> the change of raid0's behavior in error cases..because it currently does
> not care with members being removed and rely only in filesystem failures
> (after submitting many BIOs to the removed device).
>
> That said, in this change I've only took care of raid0, since in my
> understanding the other levels won't submit BIOs to dead devices; we can
> experiment that to see if it's true.

Could you please run a quick test with raid5? I am wondering whether
some race condition could get us into similar crash. If we cannot easily
trigger the bug, we can process with this version.

Thanks,
Song

>
> But I'd be happy to change all other levels also if you think it's
> appropriate (or a simple generic change to md.c if it is enough). Do you
> think we could go ahead with this change, and further improve that (to
> cover all raid cases if necessary)?
>
> Cheers,
>
>
> Guilherme
>
>
>
> [0] https://marc.info/?l=linux-raid&m=155562509905735

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
