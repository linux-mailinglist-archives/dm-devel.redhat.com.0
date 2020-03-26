Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 058C0194D4D
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 00:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585265553;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KJjPRjVoUPaNR/y2+IlyScY9/S5tW+mAuenl4yajxJk=;
	b=Cp/rtTS/xSwTxcTwEbGvAHGec7qd5C3HJDZjIXYdvAn6FxKqHNyAtF5+d8MfWKZT48+Xfk
	my8wQ1mDM0M/X5lXz/qJ5LDzUzRvHGATr2ykcSSE2lAPBGyKVOeOFm89bU9FocuVJqEN9J
	zUX5S1Lu7+Zip9p3DQXsciQJ0KgOZfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-vljQ_arZMNaEBDe_h9ISXg-1; Thu, 26 Mar 2020 19:32:31 -0400
X-MC-Unique: vljQ_arZMNaEBDe_h9ISXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F34451005510;
	Thu, 26 Mar 2020 23:32:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F06B5E002;
	Thu, 26 Mar 2020 23:32:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5276F8A03F;
	Thu, 26 Mar 2020 23:32:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QNVpHr014187 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 19:31:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7289260BF4; Thu, 26 Mar 2020 23:31:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.15.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DAF5D60BF3;
	Thu, 26 Mar 2020 23:31:46 +0000 (UTC)
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@redhat.com>)
	id 1jHbyT-0007Bh-3j; Thu, 26 Mar 2020 23:31:45 +0000
Date: Thu, 26 Mar 2020 23:31:45 +0000
From: Alasdair G Kergon <agk@redhat.com>
To: dm-devel@redhat.com, linux-lvm@redhat.com
Message-ID: <20200326233144.GM17504@agk-dp.fab.redhat.com>
Mail-Followup-To: dm-devel@redhat.com, linux-lvm@redhat.com
MIME-Version: 1.0
Organization: Red Hat UK Ltd. Registered in England and Wales, number
	03798903. Registered Office: Peninsular House, 30-36 Monument
	Street, 4th Floor, London, England, EC3R 8NB.
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: [dm-devel] storage-logger: Recording changes to the udev database
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
Content-Disposition: inline

I'm experimenting with ways of recording changes to the udev database so
you can look back at the history of the storage stack on a particular
machine.  This is still a work-in-progress, but it's reached a point
where I'd like more people to try it out.

I've written a shell script that records data related to storage uevents
in the system journal and a perl script that helps you to interrogate
this data later to create a representation of the storage components.

If you're interested, please try this out and let me know if you think
pursing this approach further would lead to something that you would
use and distributions should ship.

Source code:
  https://github.com/lvmteam/storage-logger
Fedora builds:
  https://copr.fedorainfracloud.org/coprs/agk/storage-logger/build/1320735/
Presentation:
  https://fosdem.org/2020/schedule/event/storage_logger/


Storage-logger
==============
The storage-logger project maintains a record of the storage
configuration of a linux system as it changes over time.
The idea is to provide a quick way to check the state
of a system at times in the past.

Logging
=======
The initial logging implementation is triggered by storage uevents and
consists of two components:

1. A new udev rule file, 99-zzz-storage-logger.rules, which runs after
all the other rules have run and invokes:

2. A script, udev_storage_logger.sh, that captures relevant
information about devices that changed and stores it in the system
journal.

The effect is to log relevant uevents plus some supplementary
information.  It does not yet handle filesystem-related events.

Reporting
=========
Two methods to query the data are offered:

1. journalctl
Reports the raw data using simple filtering.
Data is tagged with the identifier UDEVLOG and retrievable as
key-value pairs.
All the captured data:
  journalctl -t UDEVLOG --output verbose
or as JSON:
  journalctl -t UDEVLOG --output json
Between a time range:
  --since 'YYYY-MM-DD HH:MM:SS' 
  --until 'YYYY-MM-DD HH:MM:SS'
Other filtering features are described in the man page.

2. lsblkj
This wrapper creates a dummy system environment that "looks like" the
system did at a specified earlier time and then runs lsblk against it.
It accepts --since and --until arguments to pass to journalctl to
select the desired data, and passes other arguments controlling
the output format to the real lsblk.  
Use --verbose to watch it setting up the temporary environment .
Use --dry-run to see what it would do without actually doing it.
Use --git to create a git repository recording the changes over time.
 
Alasdair
-- 
agk@redhat.com

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

