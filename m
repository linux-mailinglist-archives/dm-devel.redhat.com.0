Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id AB29D248FD6
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 23:03:19 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355--cB9ZwuSMQOu7H9VXcyfhg-1; Tue, 18 Aug 2020 17:03:16 -0400
X-MC-Unique: -cB9ZwuSMQOu7H9VXcyfhg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 606481005E65;
	Tue, 18 Aug 2020 21:03:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 929686198C;
	Tue, 18 Aug 2020 21:03:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E4C211832FC2;
	Tue, 18 Aug 2020 21:03:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07IL2stK014990 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 17:02:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66261111144B; Tue, 18 Aug 2020 21:02:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28E501111447
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 21:02:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96CB09B4483
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 21:02:49 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-354-O50sD2TvOwumL9a1YVNwUQ-1; Tue, 18 Aug 2020 17:02:46 -0400
X-MC-Unique: O50sD2TvOwumL9a1YVNwUQ-1
Received: by mail-lf1-f65.google.com with SMTP id s9so10962011lfs.4
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 14:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QjxDFeJL3uqd+6em4nSwHG/s4baUYfLjhwPDfmfoDEg=;
	b=OhIXNbWjWA2eBnJg3EuOYlvacYp7x/0b5OAaaLmc4LpWnxlFHLgpd+SahMY+y67Nj9
	3bR0jj+8SDMLMm0TQVdco7/gYtA4mc0kC7DTpYDAA547hBqpu63M5KcGgHmo/Z6hdEnH
	6wi8pZvVgCJySPMbfUaarvi/BiPRZTXaSkRwbSmh6oIp8GwmqMRi2DcrfU/NHJ4E5GF+
	T90jwR7vFwD1j01d531KlPXxPSLbehhVhK0638gHqgdFPJust9/aMD/8ADKkYkC2+wq9
	1ngQzEoo6lY5Lrk4I0O+s9iS2tzcIW+7/95e9Ggvn1lb0527xRT8N0QYJ1017vxmx7hN
	hPRA==
X-Gm-Message-State: AOAM531eB4O/cVKO3jA0OWRhJMV3CaD1jdE+ZvTR083CU2676NEKSGfb
	xSn+J9J4oWWOvafwbEK7kO9f7Rh8wwlRpQ==
X-Google-Smtp-Source: ABdhPJyO0ZGdmwfLOP7RyirEpCb9DqFRI7soknquCzWGsV5j/TmJY2Gl/FxRTRXcwYlUqY7jYuLgFQ==
X-Received: by 2002:a05:6512:330c:: with SMTP id
	k12mr10525115lfe.151.1597784564650; 
	Tue, 18 Aug 2020 14:02:44 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
	[209.85.208.180]) by smtp.gmail.com with ESMTPSA id
	m27sm6799418lfq.19.2020.08.18.14.02.43 for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Aug 2020 14:02:43 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id v4so23040237ljd.0
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 14:02:43 -0700 (PDT)
X-Received: by 2002:a2e:b008:: with SMTP id y8mr9412922ljk.421.1597784563217; 
	Tue, 18 Aug 2020 14:02:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200807160327.GA977@redhat.com>
	<CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
	<20200807204015.GA2178@redhat.com>
	<CAMeeMh_=M3Z7bLPN3_SD+VxNbosZjXgC_H2mZq1eCeZG0kUx1w@mail.gmail.com>
In-Reply-To: <CAMeeMh_=M3Z7bLPN3_SD+VxNbosZjXgC_H2mZq1eCeZG0kUx1w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Aug 2020 14:02:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjsz_w4zyJMHSL78MuOfxKcjDDfk2GfM2ZpjSjkOfzfwQ@mail.gmail.com>
Message-ID: <CAHk-=wjsz_w4zyJMHSL78MuOfxKcjDDfk2GfM2ZpjSjkOfzfwQ@mail.gmail.com>
To: John Dorminy <jdorminy@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>,
	Damien Le Moal <damien.lemoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.9
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 18, 2020 at 1:40 PM John Dorminy <jdorminy@redhat.com> wrote:
>
>    The summary (for my FIO workloads focused on
> parallelism) is that offloading is useful for high IO depth random
> writes on SSDs, and for long sequential small writes on HDDs.

Do we have any non-microbenchmarks that might be somewhat
representative of something, and might be used to at least set a
default?

Or can we perhaps - even better - dynamically notice whether to offload or not?

I suspect that offloading is horrible for any latency situation,
particularly with any modern setup where the SSD is fast enough that
doing scheduling to another thread is noticeable.

After all, some people are working on polling IO, because the result
comes back so fast that taking the interrupt is unnecessary extra
work. Those people admittedly have faster disks than most of us, but
..

At least from a latency angle, maybe we could have the fairly common
case of a IO depth of 1 (because synchronous reads) not trigger it.

It looks like you only did throughput benchmarks (like pretty much
everybody always does, because latency benchmarks are a lot harder to
do well).

                 Linus

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

