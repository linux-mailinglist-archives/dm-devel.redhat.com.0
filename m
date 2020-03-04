Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C11BD179976
	for <lists+dm-devel@lfdr.de>; Wed,  4 Mar 2020 21:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583352221;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ozy8OakN4W4A3jnmLqrOthtd3VrQF0ccuLvqu9mjPIY=;
	b=FBeya9aSDVnumlt6OHiOvS+cpNDOquF+pWcemKCDshNHyQ+seLG03gF+sHTviKutQqRovV
	TtxayBq6PuiCegnbDlae5ahfOWGKulO+9xyDtpp08ZRaSeRymdUG3OIImaxXRpWYEMsVcn
	S5Ssq655GZezLPD4zlsyXnaI6uUNiGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-ZzDCcxHbMdOpk2vhrK3qpA-1; Wed, 04 Mar 2020 15:03:38 -0500
X-MC-Unique: ZzDCcxHbMdOpk2vhrK3qpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6D72107B7D4;
	Wed,  4 Mar 2020 20:03:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C910D10013A1;
	Wed,  4 Mar 2020 20:03:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB02B18089C8;
	Wed,  4 Mar 2020 20:03:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 024K36ii007862 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Mar 2020 15:03:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BA8E9109949; Wed,  4 Mar 2020 20:03:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4EA510994E
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 20:03:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89CBD1019E0D
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 20:03:04 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-300--s46J2WEMbigv-RRuwefQg-1; Wed, 04 Mar 2020 15:03:00 -0500
X-MC-Unique: -s46J2WEMbigv-RRuwefQg-1
Received: from callcc.thunk.org (guestnat-104-133-0-105.corp.google.com
	[104.133.0.105] (may be forged)) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 024K2oI6030142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 4 Mar 2020 15:02:51 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
	id 54F3242045B; Wed,  4 Mar 2020 15:02:50 -0500 (EST)
Date: Wed, 4 Mar 2020 15:02:50 -0500
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200304200250.GE74069@mit.edu>
References: <20200304150257.GA19885@redhat.com>
	<CAHk-=wgP=q648JXn8Hd9q7DuNaOEpLmxQp2W3RO3vkaD2CS_9g@mail.gmail.com>
	<20200304192335.GA24296@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200304192335.GA24296@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 024K36ii007862
X-loop: dm-devel@redhat.com
Cc: linux-block <linux-block@vger.kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>, Hou Tao <houtao1@huawei.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.6-rc5
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Mar 04, 2020 at 02:23:35PM -0500, Mike Snitzer wrote:
> 
> These versions are for userspace's benefit (be it lvm2, cryptsetup,
> multipath-tools, etc).  But yes, these versions are bogus even for
> that -- primarily because it requires userspace to know when a
> particular feature/fix it cares about was introduced.  In addition: if
> fixes, that also bump version, are marked for stable@ then we're quickly
> in versioning hell -- which is why I always try to decouple version
> bumps from fixes.
> 
> Others have suggested setting feature flags.  I expect you'd hate those
> too.  I suspect I quickly would too given flag bits are finite and
> really tedious to deal with.
> 
> I'll think further about this issue and consult with userspace
> developers and see what we might do.

What I do for e2fsprogs is that it looks for the existence of files in
/sys/fs/ext4/features:

% ls /sys/fs/ext4/features/
total 0
0 batched_discard  0 encryption        0 meta_bg_resize      0 verity
0 casefold         0 lazy_itable_init  0 metadata_csum_seed

I started this because sometimes ext4 features get backported
(sometimes to ancient 3.18 kernels for Android, sigh, but also once or
twice for enterprise distro kernels), and so this relieves e2fsprogs
from testing kernel versions when deciding which defaults at mke2fs
time (for example).

						- Ted


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

