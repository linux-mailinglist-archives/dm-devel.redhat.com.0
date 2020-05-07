Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 98DA61C8EEA
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 16:31:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588861875;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NySj1vrfnXS7aRCiCz+AYtClnS2dXvsCr36B8ywPhqs=;
	b=VrAtJTuAeSI8ZxZWUdWUtc/TaX8kn1NoqQzUPzM6dAlzst0HI9pXN8dUhN9QpSaXFUXZbn
	5d+KfenIQSMDd9vTtttMVWo5Nza8PmsZuikynWkw/2FZdDnz4XmGTVnyIzLcvxgTCi5iO1
	5dEZIE7k4D7Zo5bNeqSxA/KkDrt8du4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-iVaEhGrKOrqoxyvMqknmyA-1; Thu, 07 May 2020 10:30:28 -0400
X-MC-Unique: iVaEhGrKOrqoxyvMqknmyA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C09E18FE863;
	Thu,  7 May 2020 14:30:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC9BC63F96;
	Thu,  7 May 2020 14:30:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14DD94CAA0;
	Thu,  7 May 2020 14:30:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047EU2IX028513 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 10:30:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5052E70545; Thu,  7 May 2020 14:30:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 597E7707A9;
	Thu,  7 May 2020 14:29:59 +0000 (UTC)
Date: Thu, 7 May 2020 10:29:58 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Samuel Zou <zou_wei@huawei.com>
Message-ID: <20200507142958.GA12032@redhat.com>
References: <1588854412-19301-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1588854412-19301-1-git-send-email-zou_wei@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-kernel@vger.kernel.org, agk@redhat.com
Subject: Re: [dm-devel] [PATCH -next] dm mpath: Remove unused variable ret
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

On Thu, May 07 2020 at  8:26am -0400,
Samuel Zou <zou_wei@huawei.com> wrote:

> This patch fixes below warning reported by coccicheck:
> 
> drivers/md/dm-historical-service-time.c:240:14-16: Unneeded variable: "sz". Return "0" on line 261
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Samuel Zou <zou_wei@huawei.com>

Nack.

DMEMIT() uses the local sz variable.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

