Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5AACC249012
	for <lists+dm-devel@lfdr.de>; Tue, 18 Aug 2020 23:26:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-JOC8cT7TNFWeIo3rccSuyg-1; Tue, 18 Aug 2020 17:26:44 -0400
X-MC-Unique: JOC8cT7TNFWeIo3rccSuyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E52F81F022;
	Tue, 18 Aug 2020 21:26:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 607497A1DB;
	Tue, 18 Aug 2020 21:26:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 50C9C1832FC1;
	Tue, 18 Aug 2020 21:26:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07ILNPpd016580 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Aug 2020 17:23:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CA2E202278C; Tue, 18 Aug 2020 21:23:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1823D2022789
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 21:23:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0898E984BA0
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 21:23:22 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-298-uZ15A8puPjeWv8tg8CF86g-1; Tue, 18 Aug 2020 17:23:17 -0400
X-MC-Unique: uZ15A8puPjeWv8tg8CF86g-1
Received: by mail-lj1-f196.google.com with SMTP id w25so23012862ljo.12
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 14:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OmT1FnyKo0Wh0P/+e3N7XEqd970i7QN9hATVR3Wn72s=;
	b=T4AJoweqwizQj+IRMkpDbK57WNnhpQIhiueP6+dMyaKmjMNyFtxRI2vzeQphFhypy3
	a8ABsupDjYRuQMqnBBsrwMoV0oBLNHJZHUCLkDbblPHA/6zPN/UaXqoSlyLKGqI7jGAE
	Gi5KyAChB/wqGnbGTwe57x/jJySbMDEdyqRj9cG0qEVXmqyvuC8yzMzFNFg8EptTEnd0
	6W5t7LqpOaZ+eigEpQTtx0xLXQwyc2BULDs+ioh46bPkGRkZDsN6C8UjEYVSJFpYtCQQ
	cypPNXQf38U0P98oWSeDXj841YG3hYxZp0rHi3sTvzSKUxmAzl0j9zj+5CSVukaPJo/D
	tbQw==
X-Gm-Message-State: AOAM530uRvokoGTwQTBT+NOJG+r6UQviqIq49NWTh0G7U6OZAFwfL4WS
	LSZyCAOQ83SukI0N/xHOALaStQAayQcSbw==
X-Google-Smtp-Source: ABdhPJxZa8gClqXmQHe53upYegE6Pr3ic/Ry5+0xQPi5R9Mwu1BnAn+8uLHXHEabceKQ2TqtYLFKlQ==
X-Received: by 2002:a2e:8045:: with SMTP id p5mr10901852ljg.294.1597785795285; 
	Tue, 18 Aug 2020 14:23:15 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com.
	[209.85.208.180]) by smtp.gmail.com with ESMTPSA id
	z22sm6768555lfb.93.2020.08.18.14.23.13 for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Aug 2020 14:23:14 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id v4so23093489ljd.0
	for <dm-devel@redhat.com>; Tue, 18 Aug 2020 14:23:13 -0700 (PDT)
X-Received: by 2002:a2e:92d0:: with SMTP id k16mr9890735ljh.70.1597785793360; 
	Tue, 18 Aug 2020 14:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200807160327.GA977@redhat.com>
	<CAHk-=wiC=g-0yZW6QrEXRH53bUVAwEFgYxd05qgOnDLJYdzzcA@mail.gmail.com>
	<20200807204015.GA2178@redhat.com>
	<CAMeeMh_=M3Z7bLPN3_SD+VxNbosZjXgC_H2mZq1eCeZG0kUx1w@mail.gmail.com>
	<CALrw=nHD81X4YCpuk-Pp9_FSFba6LZEVUwo-YkYh1nL9pEbzpA@mail.gmail.com>
In-Reply-To: <CALrw=nHD81X4YCpuk-Pp9_FSFba6LZEVUwo-YkYh1nL9pEbzpA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Aug 2020 14:22:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj95eQxPOEMHe8j3zmpZYHbv8kZ0nz8fUUCO6acENTs0w@mail.gmail.com>
Message-ID: <CAHk-=wj95eQxPOEMHe8j3zmpZYHbv8kZ0nz8fUUCO6acENTs0w@mail.gmail.com>
To: Ignat Korchagin <ignat@cloudflare.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: JeongHyeon Lee <jhs2.lee@samsung.com>,
	Damien Le Moal <damien.lemoal@wdc.com>, John Dorminy <jdorminy@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	yangerkun <yangerkun@huawei.com>, Ming Lei <ming.lei@redhat.com>,
	linux-block <linux-block@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>, Alasdair G Kergon <agk@redhat.com>
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

On Tue, Aug 18, 2020 at 2:12 PM Ignat Korchagin <ignat@cloudflare.com> wrote:
>
> Additionally if one cares about latency

I think everybody really deep down cares about latency, they just
don't always know it, and the benchmarks are very seldom about it
because it's so much harder to measure.

> they will not use HDDs for the workflow and HDDs have much higher IO latency than CPU scheduling.

I think by now we can just say that anybody who uses HDD's don't care
about performance as a primary issue.

I don't think they are really interesting as a benchmark target - at
least from the standpoint of what the kernel should optimize for.

People have HDD's for legacy reasons or because they care much more
about capacity than performance.  Why should _we_ then worry about
performance that the user doesn't worry about?

I'm not saying we should penalize HDD's, but I don't think they are
things we should primarily care deeply about any more.

               Linus

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

