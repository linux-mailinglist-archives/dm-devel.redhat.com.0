Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B3065248FA6
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 22:40:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597783239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OVVslB5ZqM2MiVf8LXKVMdBCTVtf/nqRlzLkSwPQn8o=;
	b=RmdizvNQikXFPExBaFXGtxKgou9pPLDeDdOrAj/ZuQ3mc8U9JNcVPsBTFKv9h8ZtSaSkwF
	aRoKPpWM9AdqNvVs/H+VbCx15AMyLw+3Wa853NWn0LUQDwlzvciIoDzk262KR3NKHkjeou
	YQxKgYeuEShkOCrjIsnMVJDkUJEkDPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-QYYTKvsrNWmzax-7Gelohg-1; Tue, 18 Aug 2020 16:40:37 -0400
X-MC-Unique: QYYTKvsrNWmzax-7Gelohg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C2E010066FB;
	Tue, 18 Aug 2020 20:40:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B0D17849A;
	Tue, 18 Aug 2020 20:40:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2561D181A86E;
	Tue, 18 Aug 2020 20:40:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07IKe8hR012437 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 16:40:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A51D76379A; Tue, 18 Aug 2020 20:40:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A04F15F24D
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 20:40:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DF08811E99
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 20:40:06 +0000 (UTC)
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
	[209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-145-p8-h91hgPVOPHIszx_Tu3g-1; Tue, 18 Aug 2020 16:40:04 -0400
X-MC-Unique: p8-h91hgPVOPHIszx_Tu3g-1
Received: by mail-ua1-f72.google.com with SMTP id x12so5010394uai.23
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 13:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jq7TaraFgdD6GIFln8P44fNHpj56x8PqwtIkHGoyWF8=;
	b=ns1F2aQWgFtjDLk81DW4jRlfl67V8s2McMTnk2Sc5xB2fmuA3MNIhLj2YqfSFt+DOF
	Y3PjzswxnFQ1ToqgVXK7IkH8pwIfUO3t/mewnwuPzJwXYwVW1Ab/cnF9I4DB+umo0rEH
	PWxOJw5lf/0RZ5tL44dyyUkwC8RgCHOh3HwQUxBNtG0HhJETlv9DYhXNZcW+92gDaFnn
	TrQ2W/WOKr8CJd2s+ebNZpRFoPFMaf0hrC7ispDg71F9CYz3xaivvUPcRyFUu/3k3/Wl
	d3IQJUXA9IhRkR5fO0VjHCFrv64mI2dYaVGwfL3WTL3mGRhouH3Oi8U9kQq3jPa4KGRw
	O32g==
X-Gm-Message-State: AOAM533XUqEdJHwt3E5mg1SdxsXnKtC01nlMXbhsPj21dXJ2r0RJ81mV
	5Djcm8/JLTJKJXLL3N+/on+dTmOTllv4rKc5ILZ2jTXRdHkWVDA3p5VbrfJUstxNewTZdPfNJ6P
	1QoXqVO6UhXeNb55++ZW6KhmUOHSu9kQ=
X-Received: by 2002:ab0:6907:: with SMTP id b7mr11833391uas.127.1597783203989; 
	Tue, 18 Aug 2020 13:40:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO2C7FcRgLbOrfnCyFGrJ2KcHQLrlvHiTGOCTqJvvy/bHLksOICglYQ+74GqrFOTKDQ3niWHTELNvazWK3X8M=
X-Received: by 2002:ab0:6907:: with SMTP id b7mr11833377uas.127.1597783203699; 
	Tue, 18 Aug 2020 13:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200807160327.GA977@redhat.com>
	<CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
	<20200807204015.GA2178@redhat.com>
In-Reply-To: <20200807204015.GA2178@redhat.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Tue, 18 Aug 2020 16:39:52 -0400
Message-ID: <CAMeeMh_=M3Z7bLPN3_SD+VxNbosZjXgC_H2mZq1eCeZG0kUx1w@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For what it's worth, I just ran two tests on a machine with dm-crypt
using the cipher_null:ecb cipher. Results are mixed; not offloading IO
submission can result in -27% to +23% change in throughput, in a
selection of three IO patterns HDDs and SSDs.

(Note that the IO submission thread also reorders IO to attempt to
submit it in sector order, so that is an additional difference between
the two modes -- it's not just "offload writes to another thread" vs
"don't offload writes".) The summary (for my FIO workloads focused on
parallelism) is that offloading is useful for high IO depth random
writes on SSDs, and for long sequential small writes on HDDs.
Offloading reduced throughput for immensely high IO depths on SSDs,
where I would guess lock contention is reducing effective IO depth to
the disk; and for low IO depths of sequential writes on HDDs, where I
would guess (as it would for a zoned device) preserving submission order
is better than attempting to reorder before submission.

Two test regimes: randwrite on 7xSamsung SSD 850 PRO 128G, somewhat
aged, behind a LSI MegaRAID card providing raid0. 6 processors
(Intel(R) Xeon(R) CPU E5-1650 v2 @ 3.50GHz); 128G RAM; and seqwrite,
on a software raid0 (512k chunk size) of 4 HDDs on the same machine
specs. Scheduler 'none' for both. LSI card in writethrough cache mode.
All data in MB/s.


depth    jobs    bs    dflt    no_wq    %chg    raw disk
----------------randwrite, SSD--------------
128    1    4k    282    282    0    285
256    4    4k    251    183    -27    283
2048    4    4k    266    283    +6    284
1    4    1m    433    414    -4    403
----------------seqwrite, HDD---------------
128    1    4k    87    107    +23    86
256    4    4k    101    90     -11    91
2048    4    4k    273    233    -15    249
1    4    1m    144    146    +1    146

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

