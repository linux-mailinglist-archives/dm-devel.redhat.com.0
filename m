Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC1827185C
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 00:07:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-DpQBn7ZZMH2bhOFeY_eVPg-1; Sun, 20 Sep 2020 18:07:12 -0400
X-MC-Unique: DpQBn7ZZMH2bhOFeY_eVPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 318C81074644;
	Sun, 20 Sep 2020 22:07:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2560E5F704;
	Sun, 20 Sep 2020 22:07:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 295391826D2B;
	Sun, 20 Sep 2020 22:06:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08KM421B023370 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 20 Sep 2020 18:04:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 474532166BA0; Sun, 20 Sep 2020 22:04:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 423B42166B44
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 22:03:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9333185A78B
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 22:03:58 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-154-NuSoEmA6OYGBOclFSAL0uw-1; Sun, 20 Sep 2020 18:03:56 -0400
X-MC-Unique: NuSoEmA6OYGBOclFSAL0uw-1
Received: by mail-lj1-f196.google.com with SMTP id u4so9469274ljd.10
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 15:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ri07SWB636BQu9HeTZXldjDnXsp6QhYO/5gj4FXNUIo=;
	b=dwsvoIdv6oFk4/076w+I8iyHnsp3yhmrHriH3qjtAv8zq1xMrTjQH1v5ppB48vVRcV
	cKEbzlQCJsui26kpxFJUwvrJBjXgc6Bc8u9kRX7yIMHJdbB5K5qVAae8vsAN1+EXlSV2
	osuLb2LphtOa33Ocq1BWWt++/Lk+LXgehlDTE2HWmyQ1TLUILtT1Ii7/WNBAo/9OiZ1h
	qcueG9bjhXzywArxlB5Tw8Zlv4Irxm95NSCuCWUaNTUd8KJ3TWQYx+Nt8avyrATzVF09
	I5VCZNjmMFd1vGLBFJRyjbdYtiG2ChjSk4lMqdrxrgkdQpgHk+fQpmySphUNrdlI+zke
	+ggA==
X-Gm-Message-State: AOAM530cygl3FtbtOuoPOC4koHfFAtc7d19gATcQvJfWsNRFGJsv3Jz7
	GcjEfrmhQLkAwsb0FSXGOJqQt3JAB+nqnQ==
X-Google-Smtp-Source: ABdhPJw5wtlpGUKhgHh4aUFy28XQV3OQ0wsRh6xdzz4TJpvSn6cZq4+2APXSm8lLd5NlzWPW2KfWlg==
X-Received: by 2002:a05:651c:1056:: with SMTP id
	x22mr16558224ljm.81.1600639434404; 
	Sun, 20 Sep 2020 15:03:54 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
	[209.85.208.170]) by smtp.gmail.com with ESMTPSA id
	l16sm2202076lje.90.2020.09.20.15.03.52 for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 20 Sep 2020 15:03:53 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id y4so9486124ljk.8
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 15:03:52 -0700 (PDT)
X-Received: by 2002:a05:651c:32e:: with SMTP id
	b14mr14128964ljp.314.1600639432685; 
	Sun, 20 Sep 2020 15:03:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAPcyv4h3oKM-2hoG=FWHJwzVqjptnpQV9C+W6txfp_qcBhd7yQ@mail.gmail.com>
In-Reply-To: <CAPcyv4h3oKM-2hoG=FWHJwzVqjptnpQV9C+W6txfp_qcBhd7yQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Sep 2020 15:03:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whuR1ZHV4c6a7d3EmgRBFfQfYGckD2t1kQXDpwnf50ATA@mail.gmail.com>
Message-ID: <CAHk-=whuR1ZHV4c6a7d3EmgRBFfQfYGckD2t1kQXDpwnf50ATA@mail.gmail.com>
To: Dan Williams <dan.j.williams@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Adrian Huang12 <ahuang12@lenovo.com>
Subject: Re: [dm-devel] libnvdimm fixes 5.9-rc6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 20, 2020 at 11:56 AM Dan Williams <dan.j.williams@intel.com> wrote:
>
>    You will notice that this branch was rebased this
> morning and it has not appeared in -next. I decided to cut short the
> soak time because the infinite-recursion regression is currently
> crashing anyone attempting to test filesystem-dax in 5.9-rc5+.

Thanks for the explanation, all looks fine.

             Linus

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

