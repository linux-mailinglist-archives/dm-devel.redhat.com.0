Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B8FDE1FF765
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 17:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592494878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hsgiG56zE2RpL2+Nz47FjbhBEl7CfzV4GESlRD2gCOA=;
	b=D/RaS4gxfvxHCLtyEPhf8UM2BGMxym8XOi3dyZnUsr9rFiOf12PZFpqOCqtVjppc4u4ll6
	SqqRRHmyqKTVeyqTnpPHBe1eeDfwsOPmGjoYj+6q7mp8B1BncURhxVMUeJ1donWbRE2nFb
	gO6x8dbXxpRbYqVcpVPiFgzSU7SXsDM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-X7aFupUuP-6ndJRGvsal4w-1; Thu, 18 Jun 2020 11:41:16 -0400
X-MC-Unique: X7aFupUuP-6ndJRGvsal4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F231083E81;
	Thu, 18 Jun 2020 15:41:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AA005C1D6;
	Thu, 18 Jun 2020 15:41:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BC0951809547;
	Thu, 18 Jun 2020 15:41:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IFevZ7023287 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 11:40:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95C211002382; Thu, 18 Jun 2020 15:40:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8AEB10021B3;
	Thu, 18 Jun 2020 15:40:51 +0000 (UTC)
Date: Thu, 18 Jun 2020 11:40:50 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: yangerkun <yangerkun@huawei.com>
Message-ID: <20200618154050.GA18007@redhat.com>
References: <20200618090620.3517530-1-yangerkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200618090620.3517530-1-yangerkun@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: bmr@redhat.com, dm-devel@redhat.com, agk@redhat.com, bgurney@redhat.com
Subject: Re: [dm-devel] [PATCH v2 0/2] introduce interface to list all
	badblocks
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
Content-Disposition: inline

On Thu, Jun 18 2020 at  5:06am -0400,
yangerkun <yangerkun@huawei.com> wrote:

> 
> This patchset will list badblocks while we do 'dmsetup status'.
> 
> Image that we have mark block 1 and 2 as bad block, run following
> command will list all bad blocks:
> 
>     $ sudo dmsetup status dust1
>     0 33552384 dust 252:17 bypass verbose badblocks list: 1 2
> 
> v1->v2:
> Realize this logical in dust_status instead dust_message since the
> result can return to user directly.

Seems you've misundeerstood.  Please don't augment status to include the
listing of badblocks.  The list _could_ be extremely long.

The feedback you got earlier was to use DMEMIT() from the .message
hook.  And the listing would be provided as output from the 'dmsetup
message ...' command.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

