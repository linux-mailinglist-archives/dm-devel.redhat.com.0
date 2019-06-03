Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5E338DF
	for <lists+dm-devel@lfdr.de>; Mon,  3 Jun 2019 21:05:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30698B59AD;
	Mon,  3 Jun 2019 19:04:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC16760C9E;
	Mon,  3 Jun 2019 19:04:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EAFD1806B18;
	Mon,  3 Jun 2019 19:04:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x53J3BOS024613 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Jun 2019 15:03:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 026B968367; Mon,  3 Jun 2019 19:03:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFE1068363
	for <dm-devel@redhat.com>; Mon,  3 Jun 2019 19:03:07 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 207FFA3B73
	for <dm-devel@redhat.com>; Mon,  3 Jun 2019 19:02:58 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s22so1139303qkj.12
	for <dm-devel@redhat.com>; Mon, 03 Jun 2019 12:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=cZ8QgUQxOVV8E67IXqnBQWkwCXgwV7StlwvIUlKnFaE=;
	b=bn/GmzkLckS9FAzk5NavJ8ijkWu56tr1QvjmtAfMb7kT5rNoYmUXESVAuZFbAjawrx
	1FY2cRTqRhx5w+Sm+mzzJ8P9hoo1M6hF6n6dODaJwSCsrip1h2U4u6qAA6aYMwSa+uNZ
	gyhqM5V9ywfF57c3IiVmt8v+z+ebKezEyvsL67kjrKBP28xGXD1MBUESssd9PU8hpLcq
	Whg9WyT3VLAk/+2GLmrVDM2KpTAeVM0X4s46hz4xpOQ9gmzFhRHr4Qjs4DlggGPsgQ7N
	pVRoWm8lMSbp2JnMF0Ng37heTtO+A5tQJlDBDo1yZ8v6vxhXlU2LCOUWCVEPi02ZmSyg
	/9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=cZ8QgUQxOVV8E67IXqnBQWkwCXgwV7StlwvIUlKnFaE=;
	b=uBpXP17gdj/YS+JuFhqIx+yrYp2ZJyZglwzu2Nj5G0tYmWFRTu7/O0yl2POtnajg1A
	Pvwoy3Q7ITqh2P9jQBwxkGEjFLwA2Eojq4C+QO1tpU0dSLNQtqiS/dBFj6G5y9SwRl74
	VWS69ag4sA2JgAajxJMuPI+FmeYUpPTKblE+ZxMPPUne/U+rNMXJ8Efq2Yx/lWwwe/DC
	GB+oH4qXVBI0rEAliYf3Fw/WWX3SyJsWekxy5WODd9MOtV8Xdj5HKR9g76HK/nhm6R4E
	Mcc9Xta70ohVjbi+PJXbkHVBapBPYQN7pG0h1Mkb8z9ZFZR3vRreUF5r39xUPZ0W91Sf
	bJvw==
X-Gm-Message-State: APjAAAXL7nbP9lExJUkVe9oetOs6rXJeGj5NHY+Gp0VOJ/PSbD/1CuDZ
	6qMuqAye/daVc9cKrkh0ksLY0g==
X-Google-Smtp-Source: APXvYqyHmpsCz5rz+Hvk9XXlXZqGmMfDND49p/4y73whuJDIXglF0pSgYwKDgVxr9ZndSOYm1p3Wog==
X-Received: by 2002:a05:620a:13bc:: with SMTP id
	m28mr10365303qki.334.1559588568005; 
	Mon, 03 Jun 2019 12:02:48 -0700 (PDT)
Received: from localhost ([107.15.81.208])
	by smtp.gmail.com with ESMTPSA id p13sm1436837qkj.4.2019.06.03.12.02.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jun 2019 12:02:47 -0700 (PDT)
Date: Mon, 3 Jun 2019 15:02:45 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190603190243.zqbfsgz22k3wghby@MacBook-Pro-91.local>
References: <1559571534-16467-1-git-send-email-yi.zhang@huawei.com>
	<20190603144608.GA22116@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603144608.GA22116@redhat.com>
User-Agent: NeoMutt/20180716
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 03 Jun 2019 19:02:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Mon, 03 Jun 2019 19:02:58 +0000 (UTC) for IP:'209.85.222.195'
	DOMAIN:'mail-qk1-f195.google.com'
	HELO:'mail-qk1-f195.google.com' FROM:'josef@toxicpanda.com' RCPT:''
X-RedHat-Spam-Score: -0.803  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.222.195 mail-qk1-f195.google.com 209.85.222.195
	mail-qk1-f195.google.com <josef@toxicpanda.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Josef Bacik <jbacik@fb.com>, dm-devel@redhat.com, houtao1@huawei.com,
	agk@redhat.com, "zhangyi \(F\)" <yi.zhang@huawei.com>
Subject: Re: [dm-devel] dm log writes: make sure the log super sectors are
 written in order
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 03 Jun 2019 19:05:44 +0000 (UTC)

On Mon, Jun 03, 2019 at 10:46:08AM -0400, Mike Snitzer wrote:
> On Mon, Jun 03 2019 at 10:18am -0400,
> zhangyi (F) <yi.zhang@huawei.com> wrote:
> 
> > Currently, although we submit super bios in log-write thread orderly
> > (the super.nr_entries is incremented by each logged entry), the
> > submit_bio() cannot make sure that each super sector is written to log
> > device in order. So the submitting bio of each super sector may be
> > out-of-order, and then the final nr_entries maybe small than the real
> > entries submitted.
> > 
> > This problem can be reproduced by the xfstests generic/455 with ext4,
> > which may complained below after running the test:
> > 
> >   QA output created by 455
> >  -Silence is golden
> >  +mark 'end' does not exist
> > 
> > This patch serialize submitting super secotrs to make sure each super
> > sectors are written to log disk in order.
> > 
> > Signed-off-by: zhangyi (F) <yi.zhang@huawei.com>
> 
> This doesn't feel right.
> 
> You raised 2 things you're trying to address:
> 1) IO is out of order
> 2) accounting (nr_entries) isn't correct
> 
> I'll need to reviewer closer but serializing "super" bios doesn't seem
> like the best fix.
> 
> Josef, any chance you can weigh in on this?  AFAIK you are still "the
> man" for dm-log-writes ;)
> 

Well the #2 is caused by #1, we submit the bio for a super two times in a row
and it's a crapshoot which one makes it to disk.  So he's right, and it's kind
of funny because this is the sort of problem that dm-log-writes was written to
catch, and I fucked it up here ;).  That being said this is a bit
over-engineered, can we just add a completion to the log buff and do a
wait_for_completion() when we're writing out the super?  It's not like this thing
needs to be super performant.  Thanks,

Josef

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
