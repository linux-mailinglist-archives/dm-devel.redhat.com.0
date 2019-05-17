Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C5021B7B
	for <lists+dm-devel@lfdr.de>; Fri, 17 May 2019 18:20:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 133689FDCA;
	Fri, 17 May 2019 16:20:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 071E15DD73;
	Fri, 17 May 2019 16:20:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC69E1806B12;
	Fri, 17 May 2019 16:20:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HGKAcx031069 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 12:20:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F47260C4C; Fri, 17 May 2019 16:20:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37F4660BE0
	for <dm-devel@redhat.com>; Fri, 17 May 2019 16:20:07 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD3DE882F2
	for <dm-devel@redhat.com>; Fri, 17 May 2019 16:19:55 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id j53so8612536qta.9
	for <dm-devel@redhat.com>; Fri, 17 May 2019 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gpiccoli-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JQo9aBA95rp8OAvg+gFs24bz5ulMaCtimiFeAwP39GY=;
	b=EHpxwm3dHMfgR9agTnYXj6RWczAL0Tpdb+aDv35ZkbwI+JsZU8qVdWqK/TyHPVIbXA
	HYx5hUSSE3lhycSfKYN4fykntbOk+gCRvDtmboYN9bGghhCWMKW+BkPYJ4bv2FV8HrMU
	htxE4WfbdSwsT9WZQsjGcGSVr61CyxTRzQmTULtg8QkerJpzR8DsNe3Rm4DnvnZR5heC
	pvPsPiB6mwMOhbvQleHPXpbtLoe7jfr/9+FYFQewlY+bIuJqRbWq7/wPmhkEeHxurppM
	Q5n1gMcXf4WRsN3pyuPCgoWYJZ6o+EfDyh1jKfzFf4N3H1ntfv1S7WIKhYkl0eiwsVzY
	ENIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JQo9aBA95rp8OAvg+gFs24bz5ulMaCtimiFeAwP39GY=;
	b=MgKEew270VhmycftzXZsB48N2+rss/yFlj+47QPGSHtRh3XM6M9rSdH3p4OANxIEsy
	zUtLpgCnEoEKivQFh72+ZFlXLUMBDoD0WiH6rpFhVcL1Z6XJN25euQdrLPL8YZ+43RBV
	zz1G9oQk9EOJ9XCAd5SIkKySryFoayM1xOatqyDlCIV/wQh5QXYaySVqoQLpybYuPktc
	GP4EbYVzUieQHqCnmu9kckvPF/J/bEUvB+Tm2TFceYyfNMYSZZfycqmnbfOauHbdhTru
	xS0IXRfhEhdz7HXRchmMtbo3/pLSjoHiMo1YAx2grwFSLjOioc7jUudFBqyRJ2F5kFiz
	ps6A==
X-Gm-Message-State: APjAAAVegcMjHOwwjDC+k85KwVmmaoHekAc4CgkAr5CvVl3ijcu8zDqw
	wVW7q1q+W1yFm8SADre1XEriUYuhxFedDgdxiOiINw==
X-Google-Smtp-Source: APXvYqzuMhcd/NW5WXkxDeszD4UNp2tVLZCrFZ1IXTfTd9VNsVKaISjWgeA88f5yiB7P8wqxG6PKWsPDuCucTzpWuzg=
X-Received: by 2002:ac8:1b0a:: with SMTP id y10mr46256762qtj.91.1558109995068; 
	Fri, 17 May 2019 09:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<20190430223722.20845-2-gpiccoli@canonical.com>
	<CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
	<c8721ba3-5d38-7906-5049-e2b16e967ecf@canonical.com>
	<CAPhsuW6ahmkUhCgns=9WHPXSvYefB0Gmr1oB7gdZiD86sKyHFg@mail.gmail.com>
	<5CD2A172.4010302@youngman.org.uk>
	<0ad36b2f-ec36-6930-b587-da0526613567@gpiccoli.net>
	<5CD3096B.4030302@youngman.org.uk>
In-Reply-To: <5CD3096B.4030302@youngman.org.uk>
From: "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Date: Fri, 17 May 2019 13:19:18 -0300
Message-ID: <CALJn8nOTCcOtFJ1SzZAuJxNuxzf2Tq7Yw34h1E5XE-mbn5CUbg@mail.gmail.com>
To: Wols Lists <antlists@youngman.org.uk>, Song Liu <liu.song.a23@gmail.com>, 
	axboe@kernel.dk
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 17 May 2019 16:19:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Fri, 17 May 2019 16:19:55 +0000 (UTC) for IP:'209.85.160.193'
	DOMAIN:'mail-qt1-f193.google.com'
	HELO:'mail-qt1-f193.google.com' FROM:'guilherme@gpiccoli.net'
	RCPT:''
X-RedHat-Spam-Score: 0.003  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE) 209.85.160.193 mail-qt1-f193.google.com 209.85.160.193
	mail-qt1-f193.google.com <guilherme@gpiccoli.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: linux-raid <linux-raid@vger.kernel.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	"Guilherme G. Piccoli" <gpiccoli@canonical.com>,
	stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Jay Vosburgh <jay.vosburgh@canonical.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Fri, 17 May 2019 16:20:40 +0000 (UTC)

Jens / Song, any news in this one?

I think would be good to have this raid0 fix rather sooner than later
if possible - it's easy
to reproduce the crash.

Thanks,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
