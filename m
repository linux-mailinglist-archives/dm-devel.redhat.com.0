Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFDD1D50C2
	for <lists+dm-devel@lfdr.de>; Fri, 15 May 2020 16:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589553444;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bu+1D2NlF5hm69kbJla7Dfl49tKvbX9Imm8EVLfwDFQ=;
	b=cXt3XCzMijo4pBwfQ+1GMKl11PIMMeEvCp7m5wZGI5uGMPBcfsyp81otzhcMjvZtanoVxE
	dBLHzax5ktPeyjtSfVbf3JrAOAShwXui/4oztOxCZG5mrSCWPz5Fp8eOkxChEM65Uvav/n
	1C5OJBkn9p9flFT/WO2oQh017K3TchM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-JNT7W8lVN3u-WlVBPHdklQ-1; Fri, 15 May 2020 10:36:16 -0400
X-MC-Unique: JNT7W8lVN3u-WlVBPHdklQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 078A18014D7;
	Fri, 15 May 2020 14:36:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FCC3579A0;
	Fri, 15 May 2020 14:36:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B20B24E9FA;
	Fri, 15 May 2020 14:35:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04FEWwDU004163 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 15 May 2020 10:32:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97A0260C87; Fri, 15 May 2020 14:32:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD96960C05;
	Fri, 15 May 2020 14:32:55 +0000 (UTC)
Date: Fri, 15 May 2020 10:32:55 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200515143254.GA5098@redhat.com>
References: <202005151432.U61i8wOc%lkp@intel.com>
	<a1e65e5a-4b23-6c6e-d52f-7bf6eb69e7c8@suse.de>
MIME-Version: 1.0
In-Reply-To: <a1e65e5a-4b23-6c6e-d52f-7bf6eb69e7c8@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	kbuild-all@lists.01.org, kbuild test robot <lkp@intel.com>,
	Bob Liu <bob.liu@oracle.com>
Subject: Re: [dm-devel] [dm:for-next 53/58]
 drivers/md/dm-zoned-metadata.c:779:3: error: implicit declaration of
 function 'export_uuid'
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
Content-Disposition: inline

On Fri, May 15 2020 at  3:25am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Hi Mike,
> 
> This is cause by missing commit d01cd62400b3 ("uuid: Add inline
> helpers to import / export UUIDs"), which went into 5.7.
> Mind to update your tree?

Rebased on v5.7-rc5, thanks

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

