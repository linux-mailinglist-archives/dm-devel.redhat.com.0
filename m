Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 455B9792101
	for <lists+dm-devel@lfdr.de>; Tue,  5 Sep 2023 10:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693902455;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VrIc2Qt6iH3jyHWHAxnZxPM7OM4A6Vx5sPw5IqBV43M=;
	b=GhVggUo3Qjw/h8f8DiSVBcsVkCE0JCEQD73eMa2edFD0tlmtv1a7k+lTZ3cH9/R0iiFw2f
	GcEx4/BV0O8my/GbDEeiEqqqS+8e8YZ0IEP4X8kHnx8EZYaILS3Yh1vndKBboK48kcY6/n
	jG/Y6l9z3OzuX9zbQtI8tcSIYIBZDlA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-T0TspLPUNfa1BQe1YSMUJA-1; Tue, 05 Sep 2023 04:27:32 -0400
X-MC-Unique: T0TspLPUNfa1BQe1YSMUJA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBE61949A7E;
	Tue,  5 Sep 2023 08:27:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9DB992026D76;
	Tue,  5 Sep 2023 08:27:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 167F91946A4A;
	Tue,  5 Sep 2023 08:27:29 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A8F319465A2
 for <dm-devel@listman.corp.redhat.com>; Tue,  5 Sep 2023 08:27:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED7B31121318; Tue,  5 Sep 2023 08:27:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5A301121314
 for <dm-devel@redhat.com>; Tue,  5 Sep 2023 08:27:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA30F9423C9
 for <dm-devel@redhat.com>; Tue,  5 Sep 2023 08:27:27 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-tE8KTU3XPXur0A4Zgsb_hA-1; Tue,
 05 Sep 2023 04:27:26 -0400
X-MC-Unique: tE8KTU3XPXur0A4Zgsb_hA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 062271F74D;
 Tue,  5 Sep 2023 08:27:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5E8313499;
 Tue,  5 Sep 2023 08:27:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kwWzLmzm9mQmDgAAMHmgww
 (envelope-from <mwilck@suse.com>); Tue, 05 Sep 2023 08:27:24 +0000
Message-ID: <e4c9a98a8768c3952c134807169ddab6f154e0de.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Li Xiao Keng <lixiaokeng@huawei.com>, Christophe Varoqui
 <christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
 dm-devel mailing list <dm-devel@redhat.com>
Date: Tue, 05 Sep 2023 10:27:24 +0200
In-Reply-To: <d2aa5abb-4d73-f733-fa3c-e52a9bbf4dfc@huawei.com>
References: <d2aa5abb-4d73-f733-fa3c-e52a9bbf4dfc@huawei.com>
User-Agent: Evolution 3.48.4
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [dm-devel] [QUESTION] Is there checker to detect PDL?
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: louhongxiang@huawei.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.com
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hello Li Xiao Keng,

On Tue, 2023-09-05 at 16:06 +0800, Li Xiao Keng wrote:
> Hello:
> =A0=A0 Wmware has PDL test(https://kb.vmware.com/s/article/2004684).
> Is there has same function in multipath-tools? If not, can the
> same function be achieved?

AFAICT, PDL is not a term from the SCSI specifications, it's a
terminology that VMware uses for a certain set of sense codes and
qualifiers, as summarized on the VMware KB page you referenced.
The general concept of "PDL" doesn't exist in multipath-tools, or on
Linux in general, to my knowledge. So the answer is "no". OTOH, both
the kernel and multipath-tools do interpret the sense codes received
from the devices and try to determine an optimal reaction on the host
side.

Fabric-level errors will often result in remote ports in offline state,
which will be removed after a devloss timeout. As the SCSI device won't
exist any more after that, this is roughly similar to "PDL".=A0

But I don't think we have this for SCSI sense codes. I had a quick
glance at the code and we don't seem to treat the ASC/ASCQ 0x25/0x0 and
0x68/0x0 in a special way, neither in the kernel nor in multipath-
tools.

This means that the multipath-tools checker will treat such paths as
DOWN and continue checking them until they are removed, which won't
happen unless the bus is rescanned.

Patches welcome ;-)

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

