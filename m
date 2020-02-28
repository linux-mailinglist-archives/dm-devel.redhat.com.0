Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 28552173CE2
	for <lists+dm-devel@lfdr.de>; Fri, 28 Feb 2020 17:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582907270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+qgrH3Qr8AaKv7A+eJArYRudYw9fIJoaJllW/1F/log=;
	b=JKeBYkXgmocJnXtgpKYwizVKC+TtgPvzVsI4CMf3tyHddQMdJ9kqAkVU3S6b3n4awUgJB6
	pBxM2HxnOAekSkbtXiN9lLTDBW+//M58R50pbT6GeGl7iLmw7bvK7d23z7JzMIzhDq+W0S
	m8CO0+npAYCkAO4dUdwASGApDvEUm6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-dsvr3zqzO9W8nU56Cl-6cg-1; Fri, 28 Feb 2020 11:27:48 -0500
X-MC-Unique: dsvr3zqzO9W8nU56Cl-6cg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 625DADB60;
	Fri, 28 Feb 2020 16:27:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C1606E3EE;
	Fri, 28 Feb 2020 16:27:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 906BA84486;
	Fri, 28 Feb 2020 16:27:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SGREkp004717 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 11:27:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 343901049495; Fri, 28 Feb 2020 16:27:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FD4E1049498
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 16:27:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FEBB101A55E
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 16:27:11 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-214-2TD0A4jSNHqHhW_oV7bYCA-1; Fri, 28 Feb 2020 11:27:06 -0500
X-MC-Unique: 2TD0A4jSNHqHhW_oV7bYCA-1
Received: by mail-ot1-f68.google.com with SMTP id b3so3115118otp.4
	for <dm-devel@redhat.com>; Fri, 28 Feb 2020 08:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=akPX/Le0d2EiQmbAvQA94ZihJyml6bsfezTs1xR+aWI=;
	b=t6EJXYxTeL2Y2XHjXNBLl4jLNvirT2Lppkf9CgqO5wjPhUkI9BpBVfTUBJFo2JwG2E
	Vt3VibjbXWXTe/id5SRFVEjjgD9gvn+zvqu99vhKgpmDWAGxaK2XSq5SamErGMEoZKFw
	C/JlAOVjXNXsItcdklzhSHgBgE3sbIgL9Ykc9NycWyeUzXrpPVC25Lqxf0Tu+e/b/ANI
	YV8wBBK3LuTu+1a2Ds7HVgjGIxM8kRx4jbl5SVjcu15tm/N4AqaXeo5g5iRDuLC/olB8
	TFUc+G/LL5qK0toJOiFeCtrrgMr8IGKsiPFYxMpxQoSJLLQR59NA2eqkVK/OfNb/AP56
	pO0g==
X-Gm-Message-State: APjAAAW4DAnr2cS1CD7NzeVZ0fV+LfesQ+S3IzrJtCNojbq4WABLc+Nb
	MrXIEvq+954KEF7fPTPxG8Kf3ybhJgmmgBD0GKuVYA==
X-Google-Smtp-Source: APXvYqxPIfQgCnD3v9HTx5cFPLUInp7b+fRgEsmGH/hBamVfDcdplRO8p87KJZr4ZSNSQycJp3mYOu5p6SffilbLu3s=
X-Received: by 2002:a9d:6c9:: with SMTP id 67mr4103721otx.363.1582907225590;
	Fri, 28 Feb 2020 08:27:05 -0800 (PST)
MIME-Version: 1.0
References: <x49lfoxj622.fsf@segfault.boston.devel.redhat.com>
	<20200220215707.GC10816@redhat.com>
	<x498skv3i5r.fsf@segfault.boston.devel.redhat.com>
	<20200221201759.GF25974@redhat.com>
	<20200223230330.GE10737@dread.disaster.area>
	<20200224153844.GB14651@redhat.com>
	<20200227030248.GG10737@dread.disaster.area>
	<CAPcyv4gTSb-xZ2k938HxQeAXATvGg1aSkEGPfrzeQAz9idkgzQ@mail.gmail.com>
	<20200228013054.GO10737@dread.disaster.area>
	<CAPcyv4i2vjUGrwaRsjp1-L0wFf0a00e46F-SUbocQBkiQ3M1kg@mail.gmail.com>
	<20200228140508.GA2987@infradead.org>
In-Reply-To: <20200228140508.GA2987@infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Feb 2020 08:26:54 -0800
Message-ID: <CAPcyv4ivX2cah1YLBZzWPdULOFX7Ds4nuboPh4mf94uN1YeMVg@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01SGREkp004717
X-loop: dm-devel@redhat.com
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
	Dave Chinner <david@fromorbit.com>,
	device-mapper development <dm-devel@redhat.com>,
	Jeff Moyer <jmoyer@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [dm-devel] [PATCH v5 2/8] drivers/pmem: Allow
 pmem_clear_poison() to accept arbitrary offset and len
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 28, 2020 at 6:05 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Feb 27, 2020 at 07:28:41PM -0800, Dan Williams wrote:
> > "don't perform generic memory-error-handling, there's an fs that owns
> > this daxdev and wants to disposition errors". The fs/dax.c
> > infrastructure that sets up ->index and ->mapping would still need to
> > be there for ext4 until its ready to take on the same responsibility.
> > Last I checked the ext4 reverse mapping implementation was not as
> > capable as XFS. This goes back to why the initial design avoided
> > relying on not universally available / stable reverse-mapping
> > facilities and opted for extending the generic mm/memory-failure.c
> > implementation.
>
> The important but is that we stop using ->index and ->mapping when XFS
> is used as that enables using DAX+reflinks, which actually is the most
> requested DAX feature on XFS (way more than silly runtime flag switches
> for example).

Understood. To be clear the plan we are marching to is knock down all
the known objections to the removal of the "experimental" designation.
reflink is on that list and so is per-file dax. The thought was that
pef-file dax was a nearer term goal than reflink.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

