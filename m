Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1911CB501
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 18:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588955427;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ELHTRYSsrVrbiNdJcvBOffEMLw85aow0ISfbKVXFe6w=;
	b=f+RzRwIu0NDy/E5g4LU/UPvHGZZS8LYPQUXKrfbAyydrbroSLYJwZ2wu3WSzlSJtpQKVwa
	AwypynoMo5SQLRLj0et8XtsR5W9DOuJU9ZHFvxVBMW7WV0xJVrdyE/FoTr2t/bFxQWE7ET
	euKl4MMj4G1nPEeCFM7o3e3ZwuFgqoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-ZNObFo1POASJ44e2M3iPGA-1; Fri, 08 May 2020 12:30:24 -0400
X-MC-Unique: ZNObFo1POASJ44e2M3iPGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ED1B835B45;
	Fri,  8 May 2020 16:30:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BCC9610AF;
	Fri,  8 May 2020 16:30:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 861914CAA0;
	Fri,  8 May 2020 16:30:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048GTx7K000333 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 12:29:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 97954341FB; Fri,  8 May 2020 16:29:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B54BF2E189;
	Fri,  8 May 2020 16:29:56 +0000 (UTC)
Date: Fri, 8 May 2020 12:29:56 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20200508162955.GA18662@redhat.com>
References: <20200508090332.40716-1-hare@suse.de>
	<20200508090332.40716-2-hare@suse.de>
MIME-Version: 1.0
In-Reply-To: <20200508090332.40716-2-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 01/14] dm-zoned: add 'status' and 'message'
	callbacks
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

On Fri, May 08 2020 at  5:03am -0400,
Hannes Reinecke <hare@suse.de> wrote:

> Add callbacks to supply information for 'dmsetup status'
> and 'dmsetup info', and implement the message 'reclaim'
> to start the reclaim worker.

Same feedback from before:
https://www.redhat.com/archives/dm-devel/2020-March/msg00189.html

Who/What will use the 'reclaim' message?  Shouldn't it be documented?
Think the dmz_status changes should be split out from this reclaim
message?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

