Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C00F51D55B2
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 18:17:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589559468;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zKVyhx5q/2GGfhFyv/vcStTlqsC9sbB7VcrlUt68Y10=;
	b=AgOSFVC57QdOJsY+iZEYsLr8aalCm7l1GDSW8FY2MWARrOJmbys+adyXonqWt2Z5VDGtt0
	P4YFldWB7N2XwND7tVgpGlqTmKoF0+3IeC84oscKA8wusiurOdaVFxS+7EILW+6eIW6Zma
	5W5p3vylaJcQGmI8H3HyuTNNnBIH/zU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-fRWPxvwpN6e5dr5Jw12ctQ-1; Fri, 15 May 2020 12:17:46 -0400
X-MC-Unique: fRWPxvwpN6e5dr5Jw12ctQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C0587464;
	Fri, 15 May 2020 16:17:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E037E600F5;
	Fri, 15 May 2020 16:17:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B34E21809543;
	Fri, 15 May 2020 16:17:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04FGHCg9018176 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 12:17:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37B7F5C1D6; Fri, 15 May 2020 16:17:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 663B95C220;
	Fri, 15 May 2020 16:17:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04FGH7ft013123; 
	Fri, 15 May 2020 11:17:07 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04FGH6kf013122;
	Fri, 15 May 2020 11:17:06 -0500
Date: Fri, 15 May 2020 11:17:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Message-ID: <20200515161706.GV5907@octiron.msp.redhat.com>
References: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1589507962-6895-1-git-send-email-bmarzins@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: Re: [dm-devel] [PATCH 0/6] multipath: path validation library prep
 work
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, May 14, 2020 at 08:59:16PM -0500, Benjamin Marzinski wrote:
> I've been playing around with the SID code more and I've decided to hold
> off on submitting the library until I have it working with the SID
> multipath module better. Instead, I've pulled out the common code that
> multipath -u/-c and the library can use, and put it into libmultipath.
> 
> I've also removed some of the ordering differences between the existing
> code and my new code.  Right now, the only difference is that if a path
> is currently multipathed, it will always be claimed as a valid path.
> 
> Patches 0001 & 0002 are the same as in my "RFC PATCH v2" set, and patch
> 0005 is the same as my "libmultipath: simplify failed wwid code" patch.
> 
> Only patches 0003 and 0004 haven't been posted before.
> 

Just a note on applying this. This patch set is meant to be applied on
top of Martin's recent patchsets.

-Ben

> Benjamin Marzinski (5):
>   libmultipath: make libmp_dm_init optional
>   libmultipath: make sysfs_is_multipathed able to return wwid
>   multipath: centralize validation code
>   Unit tests for is_path_valid()
>   libmultipath: simplify failed wwid code
> 
> Martin Wilck (1):
>   libmultipath: use atomic linkat() in mark_failed_wwid()
> 
>  libmultipath/Makefile    |   2 +-
>  libmultipath/devmapper.c |  66 +++++-
>  libmultipath/devmapper.h |   4 +-
>  libmultipath/structs.h   |  24 +--
>  libmultipath/sysfs.c     |  24 ++-
>  libmultipath/sysfs.h     |   2 +-
>  libmultipath/valid.c     | 118 +++++++++++
>  libmultipath/valid.h     |  32 +++
>  libmultipath/wwids.c     | 165 ++++++++-------
>  multipath/main.c         | 295 ++++++++++++---------------
>  tests/Makefile           |   4 +-
>  tests/valid.c            | 424 +++++++++++++++++++++++++++++++++++++++
>  12 files changed, 875 insertions(+), 285 deletions(-)
>  create mode 100644 libmultipath/valid.c
>  create mode 100644 libmultipath/valid.h
>  create mode 100644 tests/valid.c
> 
> -- 
> 2.17.2
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

