Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A84541649B5
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 17:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582129003;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DoHGkcwXO3TD6v8WokTXdVOvBTp7X+OiKjmzvgFzrpk=;
	b=Qv+HsW6jS5AEdELYDKOMZbt3fWdAHjc+sESPjZ3X2Uf1QYaUczLbfHtS6zlx6fwfQjx7Jj
	VW9gAemK66Dj7pcpXiebKM8hb2jxTbI+/ZKkb9b1pfa8LhA4F/4ZwD0snSuVAEltnwFG2T
	cL1ODy91mzQLYGfRctRjZ8/awoAPegg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-0tHGHshNPte8S9gmYbtY3w-1; Wed, 19 Feb 2020 11:16:40 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6D9F800D53;
	Wed, 19 Feb 2020 16:16:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9010811F8;
	Wed, 19 Feb 2020 16:16:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08F3635B0E;
	Wed, 19 Feb 2020 16:16:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JGGSon016072 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 11:16:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9FEA2166B28; Wed, 19 Feb 2020 16:16:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1B072166B27
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 16:16:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3546D802A5A
	for <dm-devel@redhat.com>; Wed, 19 Feb 2020 16:16:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-376-pKrWYWJmNLmCXK1KLigazQ-1;
	Wed, 19 Feb 2020 11:16:16 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CF750ADF8;
	Wed, 19 Feb 2020 16:16:13 +0000 (UTC)
Message-ID: <8f4d39d663aad324017297db0d31a0a24369c9a4.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Hannes Reinecke <hare@suse.com>, dm-devel mailing
	list <dm-devel@redhat.com>
Date: Wed, 19 Feb 2020 17:17:48 +0100
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: pKrWYWJmNLmCXK1KLigazQ-1
X-MC-Unique: 0tHGHshNPte8S9gmYbtY3w-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01JGGSon016072
X-loop: dm-devel@redhat.com
Cc: "George, Martin" <Martin.George@netapp.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>, "Schremmer,
	Steven" <Steve.Schremmer@netapp.com>,
	JulianAndresKlode <julian.klode@canonical.com>
Subject: [dm-devel] RFC: multipath-tools: NVMe native multipath and default
 setting for "enable_foreign"
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

multipath-tools has support for "foreign" libraries in multipath-tools
since 0.8.0, and support for enabling/disabling them at runtime since
0.8.3.

The only foreign library that exists is "nvme" (for native NVMe
multipath), and it's likely to remain so for some time. Currently
upstream multipath-tools ships with all foreign libraries enabled by
default, and documentation about how to disable them.

There's an ongoing discussion between myself and folks from Netapp
about changing the code such that the nvme library is disabled by
default. People at Netapp are worried that multipath's output for NVMe
native multipath maps would confuse customers and break scripts.
I've suggested that Netapp simply ship a drop-in configuration file
to be put in /etc/multipath/conf.d to disable the nvme library, but I'm
told that customers are wary about vendor-supplied configuration files.

For SUSE's enterprise product, SLE, we have made this change and
disabled the nvme library by default. Now Netapp is asking me to
forward this change upstream. Personally, I'm not too fond of the
proposal, because I think the original idea (enable people to use the
tools they are used to) is still valid (*). OTOH, the "nvme" tool can
provide similar information and is likely to be used by NVMe users
anyway, so perhaps there's no urgent need for this functionality in
multipath-tools any more.

I really don't know if people out there find this feature rather
helpful or rather confusing. Therefore I'd like to ask for opinions
here on the list.

Regards,
Martin

(*) Also because I, myself, have put quite some effort into the
"foreign/nvme" feature and wouldn't be happy to see it go away. 



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

