Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EF34B1E42F3
	for <lists+dm-devel@lfdr.de>; Wed, 27 May 2020 15:11:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590585112;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sUN5iGveXtE4D6/a3L20g0iM2wQEbMXBBsdbfvUZMHk=;
	b=OZtpywF4PsnrgPaqkcP79tIwbb1mv3bKqe5NZOAFHjHO/djEvIdds15DKrWQnRPGEaCP3o
	wjodl/7dWZonNp88Y2OMQP4xPV1GO28PuTfs8Er5MiSpP/Pk5IatdtqA1nVDt2j4f5HfD1
	3RnZLG6AKt01VAbEJI/9yHs4kQLyZJA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-ttcDj5uwN0OGpeG6qymH8A-1; Wed, 27 May 2020 09:11:49 -0400
X-MC-Unique: ttcDj5uwN0OGpeG6qymH8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54BC2461;
	Wed, 27 May 2020 13:11:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 633AC60E1C;
	Wed, 27 May 2020 13:11:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93E276B499;
	Wed, 27 May 2020 13:11:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04RDBDrJ012676 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 27 May 2020 09:11:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 29EC3768A5; Wed, 27 May 2020 13:11:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1592C768AE;
	Wed, 27 May 2020 13:11:08 +0000 (UTC)
Date: Wed, 27 May 2020 09:11:07 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200527131107.GA19310@redhat.com>
References: <alpine.LRH.2.02.2005270702460.6054@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2005270702460.6054@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Heinz Mauelshagen <heinzm@redhat.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] delete dm_bufio_discard_buffers
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, May 27 2020 at  7:04am -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> Hi
> 
> I suggest to delete dm_bufio_discard_buffers because no one is using it.
> 
> If you need it in the future, tell me - and I will optimize it, so that it 
> walks the rb-tree of buffers instead of doing block-by-block lookups.
> 

OK, my only concern is: Heinz, should you have used
dm_bufio_discard_buffers() in dm-ebs commit a5089a95d84c ("dm ebs: pass
discards down to underlying device")?  Or are you certain all ebs'
bufio buffers have made it to disk?

Also now seeing that the FIXME commit a5089a95d84c removed referred to
making use of dm_bufio_discard_buffers()...

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

