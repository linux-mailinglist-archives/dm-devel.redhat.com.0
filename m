Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D7EE62FF295
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jan 2021 18:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611251869;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RMgv5vUt/XyMRR/yzovn52FX0Bokc54Qu7Kgp4XY1/c=;
	b=OAO5S/NwwqcjlC6PqomrOD29SbHZkC8ixy3f76OIL8/A8ZhBe6CNDCblykk4rTK4qx51Dg
	eTECS+3bKjteX4PUOFUNsZld4Q5+eigg+og+f8+GTl0fHQfRxgxjWPpO0nOdie6ScjwGjm
	uRXtyhKaMZjDK+ZEIBVq3TG9QwmNb3s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-UgwXw1jkNvCP5IQqvOUwzw-1; Thu, 21 Jan 2021 12:57:48 -0500
X-MC-Unique: UgwXw1jkNvCP5IQqvOUwzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F5BA80A5C1;
	Thu, 21 Jan 2021 17:57:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5F260BF3;
	Thu, 21 Jan 2021 17:57:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7D32180954D;
	Thu, 21 Jan 2021 17:57:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LHvbbX010011 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 12:57:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9360F60C6C; Thu, 21 Jan 2021 17:57:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 450F460C43;
	Thu, 21 Jan 2021 17:57:34 +0000 (UTC)
Date: Thu, 21 Jan 2021 12:57:33 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210121175733.GB4180@redhat.com>
References: <20210121175056.20078-1-mwilck@suse.com>
	<20210121175339.GA828@lst.de>
MIME-Version: 1.0
In-Reply-To: <20210121175339.GA828@lst.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, mwilck@suse.com, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v2] dm: avoid filesystem lookup in
	dm_get_dev_t()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jan 21 2021 at 12:53pm -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Mike, Jens - can we make sure this goes in before branching off the
> block branch for 5.12?  I have some work pending that would otherwise
> conflict.

Sure, I'll do my part to get this fix staged now and sent to Linus
(likely tomorrow) for 5.11-rc5.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

