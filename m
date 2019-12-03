Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE261123EC
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 08:56:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575446175;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+JswHJdP0+Jt0jNPrR0IFvlGMeF+y4bKmIgEEgh/xwo=;
	b=WLxD+A/dK6X/yea4ZUbZzk1ld8nH+s2o5F6KFhEQ68tOKULnjjJCZzzNDdkRnH1KTHjn19
	5/psy8PsGNmNe9DHZyZ5a+V3Jk7tp/9/X9IzrzxwBpmPYwq3cJnk8X2ddS9f4UTN4UInqi
	M91ijhXifJj/ey00uHljVIw01xuNRJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-5sCw2RpgM2qwHIAwYz-1nQ-1; Wed, 04 Dec 2019 02:56:14 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AEFDDB21;
	Wed,  4 Dec 2019 07:56:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C2011001B05;
	Wed,  4 Dec 2019 07:56:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41F2865D1D;
	Wed,  4 Dec 2019 07:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB3BQ9pB009296 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Dec 2019 06:26:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C4493176DD; Tue,  3 Dec 2019 11:26:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF6D6F8A05
	for <dm-devel@redhat.com>; Tue,  3 Dec 2019 11:26:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CE1B185A793
	for <dm-devel@redhat.com>; Tue,  3 Dec 2019 11:26:07 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-419-_Tn1_ss2NcGp0E_JobnQqA-1; Tue, 03 Dec 2019 06:26:03 -0500
Received: by mail-qk1-f193.google.com with SMTP id d124so3013174qke.6;
	Tue, 03 Dec 2019 03:26:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yNn5TDbf69hXamg6gs0Uhqk5YkGLvEavoffmPct4yOE=;
	b=ftF4forXttIWW+u3/P6ohgxuTF3Od8Bcz9Djx4lomwqfOva/oCSjWyTGMK7XWqnLua
	GgXGhXD5MzWoX8vR0MjkVHpmamUVSwB16fQ2OPhvFResChsButAD2EKnv7PX/9KFX9JS
	2M20/bHOupInnNccR9+9MqWcEAVzCw9TBbnCw5p7bRHjF49g/egxzOPS1tJXcGuoyEMv
	g1R+Jkli5TF6hd91inoT7sUB1pTROinmnxAdqxrayeUT+BdwUjpGB4faA1w/WA0sztVs
	KHr+g1FWj7jij+CPLLNMpvKp491WNujPNfQLv1mF+cMcRpZljEFmS2wJ0SRbHE2zbKUK
	sVaQ==
X-Gm-Message-State: APjAAAVYeIfiSP1N8YF17AW+eusKsvWlIOjfykXSiGzxwxDCTSxnt2m9
	FLoZWmyoW8wrb+ocWzslxriFdhAAsjtx1iKoTUiTaU9s
X-Google-Smtp-Source: APXvYqxdD4VR3xr+PfdSAWs9iKb4hbzHtiubcoqDjTPZPP1A5SAPbEiQoPb9h+OAAtqW08Cj2JokHdDn0o0zymsqRUM=
X-Received: by 2002:a37:6653:: with SMTP id a80mr4434002qkc.123.1575372362588; 
	Tue, 03 Dec 2019 03:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20191201054219.13146-1-Jieun.Kim4758@gmail.com>
	<201912011539.mNLLB6ra%lkp@intel.com>
	<20191202173909.GA15687@redhat.com>
In-Reply-To: <20191202173909.GA15687@redhat.com>
From: Jieun Kim <jieun.kim4758@gmail.com>
Date: Tue, 3 Dec 2019 20:25:51 +0900
Message-ID: <CABjvjx27vwFgm8OeOY+mHtHOfsYSxabiAkQ5KDguVcStZ=He1Q@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-MC-Unique: _Tn1_ss2NcGp0E_JobnQqA-1
X-MC-Unique: 5sCw2RpgM2qwHIAwYz-1nQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB3BQ9pB009296
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Dec 2019 02:53:33 -0500
Cc: dm-devel@redhat.com, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] drivers: md: dm-log.c: Remove unused
	variable 'sz'
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thank you for your reply.
I'm sorry for the compile error. I realized that 'sz' is still used.
Next time, i will keep in mind to check out the compile result
correctly before submitting patches.

On Tue, Dec 3, 2019 at 2:39 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> As you can see below: your patches to remove the seemingly unused sz
> variables won't even compile.  The sz variable is used by the DMEMIT()
> macro.
>
> Nacked-by: Mike Snitzer <snitzer@redhat.com>
>
> On Sun, Dec 01 2019 at  2:46am -0500,
> kbuild test robot <lkp@intel.com> wrote:
>
> > Hi Jieun,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on dm/for-next]
> > [also build test ERROR on v5.4 next-20191129]
> > [if your patch is applied to the wrong git tree, please drop us a note to help
> > improve the system. BTW, we also suggest to use '--base' option to specify the
> > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> >
> > url:    https://github.com/0day-ci/linux/commits/Jieun-Kim/drivers-md-dm-log-c-Remove-unused-variable-sz/20191201-134548
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
> > config: i386-defconfig (attached as .config)
> > compiler: gcc-7 (Debian 7.5.0-1) 7.5.0
> > reproduce:
> >         # save the attached .config to linux build tree
> >         make ARCH=i386
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All error/warnings (new ones prefixed by >>):
> >
> >    In file included from include/linux/dm-dirty-log.h:16:0,
> >                     from drivers/md/dm-log.c:13:
> >    drivers/md/dm-log.c: In function 'core_status':
> > >> include/linux/device-mapper.h:551:22: error: 'sz' undeclared (first use in this function); did you mean 's8'?
> >     #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
> >                          ^
> > >> drivers/md/dm-log.c:788:3: note: in expansion of macro 'DMEMIT'
> >       DMEMIT("1 %s", log->type->name);
> >       ^~~~~~
> >    include/linux/device-mapper.h:551:22: note: each undeclared identifier is reported only once for each function it appears in
> >     #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
> >                          ^
> > >> drivers/md/dm-log.c:788:3: note: in expansion of macro 'DMEMIT'
> >       DMEMIT("1 %s", log->type->name);
> >       ^~~~~~
> > --
> >    In file included from include/linux/dm-dirty-log.h:16:0,
> >                     from drivers//md/dm-log.c:13:
> >    drivers//md/dm-log.c: In function 'core_status':
> > >> include/linux/device-mapper.h:551:22: error: 'sz' undeclared (first use in this function); did you mean 's8'?
> >     #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
> >                          ^
> >    drivers//md/dm-log.c:788:3: note: in expansion of macro 'DMEMIT'
> >       DMEMIT("1 %s", log->type->name);
> >       ^~~~~~
> >    include/linux/device-mapper.h:551:22: note: each undeclared identifier is reported only once for each function it appears in
> >     #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
> >                          ^
> >    drivers//md/dm-log.c:788:3: note: in expansion of macro 'DMEMIT'
> >       DMEMIT("1 %s", log->type->name);
> >       ^~~~~~
> >
> > vim +/DMEMIT +788 drivers/md/dm-log.c
> >
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  776
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  777  #define    DMEMIT_SYNC \
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  778     if (lc->sync != DEFAULTSYNC) \
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  779             DMEMIT("%ssync ", lc->sync == NOSYNC ? "no" : "")
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  780
> > 416cd17b198221 Heinz Mauelshagen  2008-04-24  781  static int core_status(struct dm_dirty_log *log, status_type_t status,
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  782                    char *result, unsigned int maxlen)
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  783  {
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  784     struct log_c *lc = log->context;
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  785
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  786     switch(status) {
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  787     case STATUSTYPE_INFO:
> > 315dcc226f066c Jonathan E Brassow 2007-05-09 @788             DMEMIT("1 %s", log->type->name);
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  789             break;
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  790
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  791     case STATUSTYPE_TABLE:
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  792             DMEMIT("%s %u %u ", log->type->name,
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  793                    lc->sync == DEFAULTSYNC ? 1 : 2, lc->region_size);
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  794             DMEMIT_SYNC;
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  795     }
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  796
> > 2a79ee10b97355 Jieun Kim          2019-12-01  797     return 0;
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  798  }
> > ^1da177e4c3f41 Linus Torvalds     2005-04-16  799
> >
> > :::::: The code at line 788 was first introduced by commit
> > :::::: 315dcc226f066c1d3cef79283dcde807fe0e32d1 dm log: report fault status
> >
> > :::::: TO: Jonathan E Brassow <jbrassow@redhat.com>
> > :::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>
> >
> > ---
> > 0-DAY kernel test infrastructure                 Open Source Technology Center
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation
>
>


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

