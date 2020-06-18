Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 18C4D1FF7A8
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 17:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592495110;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RCm5SmGPGbjnYEkx3JhwKhEr6RtfcTsFJVe7ZM0py1w=;
	b=gH9VhA1E2hlAtLzRh7s/JhnnNo6PdPZ2UunpSacxIKc9EjuI90K+soz/wraPI/sOlo+VJr
	PYRLRWVaQN/7rKOEJO6JroypYB8VE7KjpP3meGOU8FVtWjkOZJDgB2NCWwjiZ9gPpEFXu/
	geG+jFBrsU2ZJfalRCafkxdR0wcKfyc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-MlNZsAJrOAO9mlPeZWXKLw-1; Thu, 18 Jun 2020 11:45:04 -0400
X-MC-Unique: MlNZsAJrOAO9mlPeZWXKLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C7CD835B42;
	Thu, 18 Jun 2020 15:44:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A165C1D0;
	Thu, 18 Jun 2020 15:44:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90B06833C6;
	Thu, 18 Jun 2020 15:44:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IFin3I024169 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 11:44:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AED617166C; Thu, 18 Jun 2020 15:44:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD81B71660;
	Thu, 18 Jun 2020 15:44:45 +0000 (UTC)
Date: Thu, 18 Jun 2020 11:44:45 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: JeongHyeon Lee <jhs2.lee@samsung.com>
Message-ID: <20200618154444.GB18007@redhat.com>
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
	<98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
MIME-Version: 1.0
In-Reply-To: <98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, agk@redhat.com, corbet@lwn.net
Subject: Re: [dm-devel] New mode DM-Verity error handling
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 18 2020 at  2:56am -0400,
JeongHyeon Lee <jhs2.lee@samsung.com> wrote:

> Hello, Dear devcice-mapper maintainers.
> 
> I'm JeongHyeon Lee, work in Samsung. I'm chage of DM-Verity feature with 
> Mr. sunwook eom.
> I have a patch or suggestion about DM-Verity error handling.
> 
> Our device (smart phone) need DM-Verity feature. So I hope there is new 
> mode DM-Verity error handling.
> This new mode concept is When detect corrupted block, will be go to panic.
> 
> Because our team policy is found device DM-Verity error, device will go 
> panic.
> And then analyze what kind of device fault (crash UFS, IO error, DRAM 
> bit flip etc)
> 
> In addition to the smart phone, I would like to have an option that 
> users or administrators can use accordingly.
> There are patch contents in the attachment. I would really appreciate it 
> if you could check it.
> 
> I will look forward to hearing from yours.
> Thank you :)
> 

I do not accept that panicing the system because of verity failure is
reasonable.

In fact, even rebooting (via DM_VERITY_MODE_RESTART) looks very wrong.

The device should be put in a failed state and left for admin recovery.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

