Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B497A29E
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 725913084288;
	Tue, 30 Jul 2019 07:55:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A4115C1A1;
	Tue, 30 Jul 2019 07:55:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CD721800203;
	Tue, 30 Jul 2019 07:55:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TKIwNx026295 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 16:18:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6D6295D9CA; Mon, 29 Jul 2019 20:18:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 691635D9C9
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:18:56 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [91.121.75.85])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85919307D985
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:18:53 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
	by len.romanrm.net (Postfix) with SMTP id 3D8BE202D3;
	Mon, 29 Jul 2019 20:18:50 +0000 (UTC)
Date: Tue, 30 Jul 2019 01:18:50 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Message-ID: <20190730011850.2f19e140@natsu>
In-Reply-To: <20190729193359.11040-1-gpiccoli@canonical.com>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, ACL 264 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 29 Jul 2019 20:18:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Mon, 29 Jul 2019 20:18:55 +0000 (UTC) for IP:'91.121.75.85'
	DOMAIN:'len.romanrm.net' HELO:'len.romanrm.net'
	FROM:'rm@romanrm.net' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 91.121.75.85 len.romanrm.net 91.121.75.85
	len.romanrm.net <rm@romanrm.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 03:55:28 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
 block device is gone
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 30 Jul 2019 07:55:48 +0000 (UTC)

On Mon, 29 Jul 2019 16:33:59 -0300
"Guilherme G. Piccoli" <gpiccoli@canonical.com> wrote:

> Currently md/raid0 is not provided with any mechanism to validate if
> an array member got removed or failed. The driver keeps sending BIOs
> regardless of the state of array members. This leads to the following
> situation: if a raid0 array member is removed and the array is mounted,
> some user writing to this array won't realize that errors are happening
> unless they check kernel log or perform one fsync per written file.
> 
> In other words, no -EIO is returned and writes (except direct ones) appear
> normal. Meaning the user might think the wrote data is correctly stored in
> the array, but instead garbage was written given that raid0 does stripping
> (and so, it requires all its members to be working in order to not corrupt
> data).

If that's correct, then this seems to be a critical weak point in cases when
we have a RAID0 as a member device in RAID1/5/6/10 arrays.

-- 
With respect,
Roman

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
