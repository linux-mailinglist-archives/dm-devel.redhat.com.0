Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDA5249403
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 06:26:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597811175;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ThM7+2IJ5Vp0Z60HtwDOq2Pi6Yzi1Mnc8mW/sjypIgs=;
	b=CKLWFrxQLSELpb48B/xG84azB8T9Zh6amJsXA0UAYQtZ1qSj4h3dGX5cFue+jru/NYJTc5
	qIELItsrJlfk3EkG7SCAckx5LvyJprGgJ0sihrQcJMDlGM0L2a5wCMrskZO49Z92chc/aT
	AWWN9p+o7Uzz1QovmqEFLCgSBEG0SUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-Sm5e0gRTNNKp24s8-lE1wg-1; Wed, 19 Aug 2020 00:26:12 -0400
X-MC-Unique: Sm5e0gRTNNKp24s8-lE1wg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 453E21DDFC;
	Wed, 19 Aug 2020 04:26:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AEE15B680;
	Wed, 19 Aug 2020 04:25:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D373180B656;
	Wed, 19 Aug 2020 04:25:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07J4Pgoe023504 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 00:25:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30B2F1004171; Wed, 19 Aug 2020 04:25:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C0D6100416A
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 04:25:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC54C857CE1
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 04:25:38 +0000 (UTC)
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
	[209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-546-8VQNRbfHPZ2SZfT1molxfQ-1; Wed, 19 Aug 2020 00:25:36 -0400
X-MC-Unique: 8VQNRbfHPZ2SZfT1molxfQ-1
Received: by mail-ua1-f69.google.com with SMTP id q3so5550960uap.13
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 21:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R5xoXHfY7Hx9a4qXAIGO65sRQTEoqN+pm9vJlgSDX9c=;
	b=ctgWEqj8HNugg35xxRb2KoQxIk1uLhc791gAxQBzObwUMqEZ2LPr11wIteNDC/fFSS
	D9xSzLnOGGNch1NRW4BqKaCbtrqcO/CiYwB6cMlTdaXWoFgdCaJOY2hfagO8yHrgzDlV
	4VYYh7qOLZKmoRqRpUMVJ2nLN/rCI0rI+hn1fs0Rsn+5FDUhTR9AyrF81thteobhmRUi
	7sH0lw9lT79032xK/GEiId+EfKmI+g7pdSRslD9B6HotDLG6eR0AAUO2eC4msscj5Cbm
	FDIdLS/CJJX41BIu85rI2pa4mRFam0YsfYmXhTBt5jP2oYlm35XBiHrUp4PhOdwO0WpN
	Pnlg==
X-Gm-Message-State: AOAM53040n+tNGI81mUE0sSpIT58zYNddtU6Uwd+k8CMUaXiVXvv8ERO
	7uL/2eRxOZd+42gCgr2v7Xg1JKWuK39NBbFnHn2b9NuljZ38Vz946GVSe4/wUj4H3UXCULy+F6j
	1CyiHKcQ9M8Ph5QeqAuIzVnTmsJZtBOY=
X-Received: by 2002:a67:69c3:: with SMTP id e186mr12369955vsc.20.1597811132284;
	Tue, 18 Aug 2020 21:25:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIFPUsE/VWuXb9s9uNGUuCZINz6bavw3tjyGN+MxKJLIhreNrKa3v7D09cqxb/fkrSKNhD003/B44UPM4+fyI=
X-Received: by 2002:a67:69c3:: with SMTP id e186mr12369946vsc.20.1597811132053;
	Tue, 18 Aug 2020 21:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200807160327.GA977@redhat.com>
	<CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
	<20200807204015.GA2178@redhat.com>
	<CAMeeMh_=M3Z7bLPN3_SD+VxNbosZjXgC_H2mZq1eCeZG0kUx1w@mail.gmail.com>
	<CALrw=nHD81X4YCpuk-Pp9_FSFba6LZEVUwo-YkYh1nL9pEbzpA@mail.gmail.com>
	<CAHk-=wj95eQxPOEMHe8j3zmpZYHbv8kZ0nz8fUUCO6acENTs0w@mail.gmail.com>
In-Reply-To: <CAHk-=wj95eQxPOEMHe8j3zmpZYHbv8kZ0nz8fUUCO6acENTs0w@mail.gmail.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Wed, 19 Aug 2020 00:25:20 -0400
Message-ID: <CAMeeMh_4j9EyOB3evyHi536d8kocH3egPdGO_FZj+G5iZzkVrQ@mail.gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Your points are good. I don't know a good macrobenchmark at present,
but at least various latency numbers are easy to get out of fio.

I ran a similar set of tests on an Optane 900P with results below.
'clat' is, as fio reports, the completion latency, measured in usec.
'configuration' is [block size], [iodepth], [jobs]; picked to be a
varied selection that obtained excellent throughput from the drive.
Table reports average, and 99th percentile, latency times as well as
throughput. It matches Ignat's report that large block sizes using the
new option can have worse latency and throughput on top-end drives,
although that result doesn't make any sense to me.

Happy to run some more there or elsewhere if there are suggestions.

devicetype    configuration    MB/s    clat mean    clat 99%
------------------------------------------------------------------
nvme base    1m,32,4     2259    59280       67634
crypt default    1m,32,4     2267    59050       182000
crypt no_w_wq    1m,32,4     1758    73954.54    84411
nvme base    64k,1024,1    2273    29500.92    30540
crypt default    64k,1024,1    2167    29518.89    50594
crypt no_w_wq    64k,1024,1    2056    31090.23    31327
nvme base    4k,128,4    2159      924.57    1106
crypt default    4k,128,4    1256     1663.67    3294
crypt no_w_wq    4k,128,4    1703     1165.69    1319

Ignat, how do these numbers match up to what you've been seeing?

-John


On Tue, Aug 18, 2020 at 5:23 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Aug 18, 2020 at 2:12 PM Ignat Korchagin <ignat@cloudflare.com> wrote:
> >
> > Additionally if one cares about latency
>
> I think everybody really deep down cares about latency, they just
> don't always know it, and the benchmarks are very seldom about it
> because it's so much harder to measure.
>
> > they will not use HDDs for the workflow and HDDs have much higher IO latency than CPU scheduling.
>
> I think by now we can just say that anybody who uses HDD's don't care
> about performance as a primary issue.
>
> I don't think they are really interesting as a benchmark target - at
> least from the standpoint of what the kernel should optimize for.
>
> People have HDD's for legacy reasons or because they care much more
> about capacity than performance.  Why should _we_ then worry about
> performance that the user doesn't worry about?
>
> I'm not saying we should penalize HDD's, but I don't think they are
> things we should primarily care deeply about any more.
>
>                Linus
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

