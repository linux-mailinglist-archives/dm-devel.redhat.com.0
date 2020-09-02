Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD3E25B0A2
	for <lists+dm-devel@lfdr.de>; Wed,  2 Sep 2020 18:05:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599062699;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ww75TCZFH0At3d3xT7R/0/Ha+Qktg+OrEmDB/8RUqpg=;
	b=eUoTDw61GZaxMZXZtWo86GWhV9PCwXPnmzQ4SnV2eTrlmxL+hS7ddrC/tgfahPL5GDt+CX
	Ggxg4dJ+rguGC1BLeWPjGfJJ88bKwjI/5BEYJad5Fv7csvvPIyfu9ZhiPw8t8HNYP9LQvL
	uC9EpN0/N1DyykckKgO3aPIl06g4g0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-T5zsyePON4uQt77PXKmt6A-1; Wed, 02 Sep 2020 12:04:56 -0400
X-MC-Unique: T5zsyePON4uQt77PXKmt6A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00B931005504;
	Wed,  2 Sep 2020 16:04:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86CB95C1C4;
	Wed,  2 Sep 2020 16:04:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3EB7779DAA;
	Wed,  2 Sep 2020 16:04:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 082G4au4002140 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 2 Sep 2020 12:04:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1072E59; Wed,  2 Sep 2020 16:04:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 302D561983;
	Wed,  2 Sep 2020 16:04:33 +0000 (UTC)
Date: Wed, 2 Sep 2020 12:04:32 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Coly Li <colyli@suse.de>, Jan Kara <jack@suse.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
	Vishal Verma <vishal.l.verma@intel.com>
Message-ID: <20200902160432.GA5513@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-nvdimm@lists.01.org
Subject: [dm-devel] flood of "dm-X: error: dax access failed" due to 5.9
 commit 231609785cbfb
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

5.9 commit 231609785cbfb ("dax: print error message by pr_info() in
__generic_fsdax_supported()") switched from pr_debug() to pr_info().

The justification in the commit header is really inadequate.  If there
is a problem that you need to drill in on, repeat the testing after
enabling the dynamic debugging.

Otherwise, now all DM devices that aren't layered on DAX capable devices
spew really confusing noise to users when they simply activate their
non-DAX DM devices:

[66567.129798] dm-6: error: dax access failed (-5)
[66567.134400] dm-6: error: dax access failed (-5)
[66567.139152] dm-6: error: dax access failed (-5)
[66567.314546] dm-2: error: dax access failed (-95)
[66567.319380] dm-2: error: dax access failed (-95)
[66567.324254] dm-2: error: dax access failed (-95)
[66567.479025] dm-2: error: dax access failed (-95)
[66567.483713] dm-2: error: dax access failed (-95)
[66567.488722] dm-2: error: dax access failed (-95)
[66567.494061] dm-2: error: dax access failed (-95)
[66567.498823] dm-2: error: dax access failed (-95)
[66567.503693] dm-2: error: dax access failed (-95)

commit 231609785cbfb must be reverted.

Please advise, thanks.
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

