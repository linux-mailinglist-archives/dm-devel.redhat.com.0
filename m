Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7D11FF9EE
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 19:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592500245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zzHK3eLWPg0f8m8Nf/A1WMd8+UIV9O56ivZAZa/Qf+M=;
	b=OQ6q1nb3YEVuQz7cc8Y9fjLVyxKjQjUPgLFE22KrquErS4vcYqGRXEulFpcrhBiYXLq9Xv
	tmWZOZ/xTjIkaX/GLuApANKkJN32nigdy918gfIH6S28bG0PIj1oImvAvdgiMSb+c2QHnS
	DKR51M90221KRq0b1PAX83WnFANAIC8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-QsA3ogDEPlK98axnqDV7JQ-1; Thu, 18 Jun 2020 13:10:42 -0400
X-MC-Unique: QsA3ogDEPlK98axnqDV7JQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01D81184D148;
	Thu, 18 Jun 2020 17:10:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D59319C79;
	Thu, 18 Jun 2020 17:10:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71DF4833C6;
	Thu, 18 Jun 2020 17:10:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IH9xlV003510 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 13:09:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B3A85D9EF; Thu, 18 Jun 2020 17:09:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65EEB5D9E5;
	Thu, 18 Jun 2020 17:09:53 +0000 (UTC)
Date: Thu, 18 Jun 2020 13:09:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Message-ID: <20200618170952.GA18057@redhat.com>
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
	<98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
	<20200618154444.GB18007@redhat.com>
	<20200618165006.GA103290@google.com>
MIME-Version: 1.0
In-Reply-To: <20200618165006.GA103290@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	JeongHyeon Lee <jhs2.lee@samsung.com>, dm-devel@redhat.com, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jun 18 2020 at 12:50pm -0400,
Sami Tolvanen <samitolvanen@google.com> wrote:

> On Thu, Jun 18, 2020 at 11:44:45AM -0400, Mike Snitzer wrote:
> > I do not accept that panicing the system because of verity failure is
> > reasonable.
> > 
> > In fact, even rebooting (via DM_VERITY_MODE_RESTART) looks very wrong.
> > 
> > The device should be put in a failed state and left for admin recovery.
> 
> That's exactly how the restart mode works on some Android devices. The
> bootloader sees the verification error and puts the device in recovery
> mode. Using the restart mode on systems without firmware support won't
> make sense, obviously.

OK, so I need further justification from Samsung why they are asking for
this panic mode.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

