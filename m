Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0D02A2A90
	for <lists+dm-devel@lfdr.de>; Mon,  2 Nov 2020 13:17:58 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-wOPYZQ7tMeCNKIotvNu8HQ-1; Mon, 02 Nov 2020 07:17:55 -0500
X-MC-Unique: wOPYZQ7tMeCNKIotvNu8HQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA59B101962F;
	Mon,  2 Nov 2020 12:17:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 086AC5DA6B;
	Mon,  2 Nov 2020 12:17:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75FCC8C7B3;
	Mon,  2 Nov 2020 12:17:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A2CHb1c020917 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 07:17:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 44D64215671F; Mon,  2 Nov 2020 12:17:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 406CF2156728
	for <dm-devel@redhat.com>; Mon,  2 Nov 2020 12:17:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A05F18007A4
	for <dm-devel@redhat.com>; Mon,  2 Nov 2020 12:17:34 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) by
	relay.mimecast.com with ESMTP id us-mta-468-hNPzYkMDNIu5zAOBVcyEAw-1;
	Mon, 02 Nov 2020 07:17:30 -0500
X-MC-Unique: hNPzYkMDNIu5zAOBVcyEAw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 83304AE35;
	Mon,  2 Nov 2020 12:17:29 +0000 (UTC)
Message-ID: <e77c4409175db94f97543991632c323a78ab3ef9.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>
Date: Mon, 02 Nov 2020 13:17:28 +0100
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Subject: [dm-devel] Thoughts about multipathd's log thread
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

(sending again, with dm-devel on cc. Sorry!)

Hi Ben, hi Christophe,

AFAIU, the purpose of the log thread is to avoid blocking while writing
log messages to the syslog socket. The thread has been in place for a
long time. However, the large majority of multipath installations today
runs on systemd-enabled systems, where we don't use the log thread.
Rather, we write to stderr (which is actually a journald socket)
directly.

That makes me wonder: if the problem of blocking while writing to the
log socket is real, it should happen with journald as well (possibly
more so than with syslogd; journald doesn't exactly have the reputation
of being highly efficient). Thus, we should be using the log thread
also for the systemd case. OTOH, I'm not aware of any bug reports
saying that multipathd wasn't able to handle events because of blocking
log calls. So perhaps the issue is rather theoretical? In that case, we
could do away with all the complexity the log thread involves.

What do you think?

Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

