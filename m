Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 30C491B79CE
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 17:43:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587742999;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MzCiG/80fUiQHI9iAkOwZ13NODTclLnorPURe6Q4LSQ=;
	b=NxqzKplHT9v0WCkYqbHDbtGQ/NynE7QYwJRzq/i6l6zFlLUj76qyqQSxUjdlH/oy0b4OnN
	l40ollVT7PAUZjMJYimmIpmJAslaIWy7lSx3XZqzoGVfnJh3yB4htPl/8TV9iPKqNLo3at
	VrWrk9HxGCzQxnzhanMKslNRcPdh1AA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-skIxiMwTOUWn5q5fJRfPBA-1; Fri, 24 Apr 2020 11:43:16 -0400
X-MC-Unique: skIxiMwTOUWn5q5fJRfPBA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBCA01083E87;
	Fri, 24 Apr 2020 15:43:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 790105D70C;
	Fri, 24 Apr 2020 15:43:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EBF14E561;
	Fri, 24 Apr 2020 15:42:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OFgfSD013117 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 11:42:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9714C5D9D7; Fri, 24 Apr 2020 15:42:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast06.extmail.prod.ext.phx2.redhat.com [10.5.110.77])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91DC95D9D5
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 15:42:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B87E98AF596
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 15:42:26 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-80-kzVOhmclM_WaZcFT3iVy1w-1;
	Fri, 24 Apr 2020 11:40:16 -0400
X-MC-Unique: kzVOhmclM_WaZcFT3iVy1w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1B410AD4F;
	Fri, 24 Apr 2020 15:40:14 +0000 (UTC)
Message-ID: <59c267942a058b9bb989abbf1dbcc99ee4ee9cc3.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Gioh Kim <gi-oh.kim@cloud.ionos.com>
Date: Fri, 24 Apr 2020 17:40:13 +0200
In-Reply-To: <CAJX1YtYV9j-jmW9W9FaFcndYM2CT9xLLXTs=RW-a4SB=h1N-KQ@mail.gmail.com>
References: <CAJX1YtZiGXdZTrGtw8ksP3khRf26jQ7dhBWoEJcGfQQZMGb-gg@mail.gmail.com>
	<086d3e2baae71658539ac7caf634336ea0927c04.camel@suse.com>
	<CAJX1YtaKhjLNN56rvwAXh7tOP1Egbo1izmFn3OUEhD4c489E1w@mail.gmail.com>
	<3dbafeb000d558af21db70816130573106b56a9c.camel@suse.com>
	<CAJX1YtYw+aJ5xXjZKoksF9gh3aaJoQRiqAkjUigc5R0-bFPb1w@mail.gmail.com>
	<afac68664b44a28203325fed2fee7d8c0d9ae750.camel@suse.com>
	<CAJX1YtYV9j-jmW9W9FaFcndYM2CT9xLLXTs=RW-a4SB=h1N-KQ@mail.gmail.com>
User-Agent: Evolution 3.34.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03OFgfSD013117
X-loop: dm-devel@redhat.com
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, Jinpu, dm-devel@redhat.com,
	Wang <jinpu.wang@cloud.ionos.com>
Subject: Re: [dm-devel] 'multipath add path' returns ok but the path is
 missing in the topology
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-24 at 15:18 +0200, Gioh Kim wrote:
> 
> I would like to inform you of what I found out.
> 1. 'multipathd add path sdx' is executed
> 2. Adding thd sdx also creates a map.
> 3. The multipathd daemon waits for the change uevent from kernel.
> 4. Another sd device sdy is added with 'multipathd add path sdy'
> command
> 5. adding sdy is not done and multipathd prints a message "sdy:
> orphan
> path, waiting for create to complete"
> 6. Something (I guess it is the checker thread) removes and adds the
> dm device
> 7. sdy is removed with a message "sdy: orphan path, path removed
> externally". I guess the checker thread removes sdy as well.
> 
> I am not sure what removes the dm device and sdy device.
> I guess it would be the check thread due to the "sdy: orphan path,
> path removed externally" message.
> 
> Therefore I just added the 'udevadm settle' command after the
> 'multipathd add path sdx' command.
> So whenever my script executes 'multipathd add path', it also
> executes
> 'udevadm settle'.
> Then my test is fine for a long time.
> 
> 

This really sounds like a bug in the wait_for_udev handling.
Could you provide a full log of these events with "verbosity 3"?
No need to post it to the ML, send it privately or put it on some paste
service.

Regards
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

