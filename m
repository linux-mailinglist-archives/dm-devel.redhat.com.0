Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B22F71A73B2
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586845789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PQPhc3KGXdICHDmDhVf7azlDSFnAYpk2bhVOC2ENv4c=;
	b=bmM9XPKbErznbPee8WCP4C5OTkm5P4QnSRN1vHWSmQHhH5x8FWo5ShLyW9lBQlAJ4hk6ls
	YfHj1AV9+CWaLbVppKOv4jaFGtXI7bGSS74bawaT2BQ+oFhmwoiMFQad/Mbd02OPI1349W
	q39eZITvKF+B24jOczct6/TVENZU5zY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-WHCkcgvjOESlMO_6xYtRtQ-1; Tue, 14 Apr 2020 02:29:47 -0400
X-MC-Unique: WHCkcgvjOESlMO_6xYtRtQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42875108592C;
	Tue, 14 Apr 2020 06:29:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17569272A0;
	Tue, 14 Apr 2020 06:29:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1A1893068;
	Tue, 14 Apr 2020 06:29:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03C8FNnn031629 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 12 Apr 2020 04:15:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BFFDA4868; Sun, 12 Apr 2020 08:15:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68248A3193
	for <dm-devel@redhat.com>; Sun, 12 Apr 2020 08:15:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 188438FF67A
	for <dm-devel@redhat.com>; Sun, 12 Apr 2020 08:15:21 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-26-b2UcB9tFPfWHlczgsqffcg-1; Sun, 12 Apr 2020 04:15:18 -0400
X-MC-Unique: b2UcB9tFPfWHlczgsqffcg-1
Received: by mail-il1-f194.google.com with SMTP id c17so2195826ilk.6
	for <dm-devel@redhat.com>; Sun, 12 Apr 2020 01:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=c/Lb56tGiXdOhLm4M0kNSqw6FPBoSkeoJ2b2tzoaiUg=;
	b=S2GnQZPip+ygjHmXLrdtBO/rLpXCC8bHLV/7cM2aFhKu457n4+FCppCz45FWYiwaU5
	L+3JqMa397uNoLRslEd9/M85DLw7WU8umoed7QKW0MTA3vyKvmAE3M3XsZIeixw3HYhH
	d2RBJLWSMuK0rvLV+LJpEFQSvBCStAInycB1PqBY5nzkbUInH7jJHMTsnJ316uBznMFp
	TdXWsKbcAf8eMtoJqnEjNsJKD+HLr2Tlg1kvxfaSm9pczGHjrWJ2A46JI8sT/FaTZQxx
	2pffYB/ag36tZz6Z6WKuYAGtLaKSjz3PFg2JaEjbIYzQ9up2mbCn+AlREjSSo0dOwSzB
	NeAQ==
X-Gm-Message-State: AGi0Pua9UsEdNP7Pb/G+jYnqp+iCgH+sQwnF0qjzbISFmy6H8C2AMISI
	TUNtCSuPxgEWvwIj90yDRLc8kzBeMKvsFrTXNfY=
X-Google-Smtp-Source: APiQypLrgetzg3xkZ+c4aa3/NRG/TMq0oNUgTRtFJ+4YwTFwuFx2KOSYw7Q3K9sS6y5hElbohZU31ooLD7r7jKIxFiI=
X-Received: by 2002:a92:dc43:: with SMTP id x3mr4747407ilq.102.1586679317629; 
	Sun, 12 Apr 2020 01:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
	<CAB9W1A1=JyOV3-+6jn3xX-M+GKWBB2cCNh-VWB_kzf+YiR_d2Q@mail.gmail.com>
In-Reply-To: <CAB9W1A1=JyOV3-+6jn3xX-M+GKWBB2cCNh-VWB_kzf+YiR_d2Q@mail.gmail.com>
From: "Lev R. Oshvang ." <levonshe@gmail.com>
Date: Sun, 12 Apr 2020 11:15:06 +0300
Message-ID: <CAP22eLGJbSvUU=W0Jp=gvOFv-nxLC8YTnta3OU2PKbh746MCkQ@mail.gmail.com>
To: Stephen Smalley <stephen.smalley@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03C8FNnn031629
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 02:29:26 -0400
Cc: sashal@kernel.org, nramas@linux.microsoft.com,
	SELinux <selinux@vger.kernel.org>,
	LSM List <linux-security-module@vger.kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	James Morris <jmorris@namei.org>, chpebeni@linux.microsoft.com,
	dm-devel@redhat.com, suredd@microsoft.com,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, balajib@microsoft.com
Subject: Re: [dm-devel] [RFC] IMA: New IMA measurements for dm-crypt and
	selinux
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 11, 2020 at 10:07 PM Stephen Smalley
<stephen.smalley@gmail.com> wrote:
>
> On Wed, Apr 8, 2020 at 6:28 AM Tushar Sugandhi
> <tusharsu@linux.microsoft.com> wrote:
> > Measuring SELinux status and various SELinux policies can help ensure
> > mandatory access control of the system is not compromised.
> <snip>
> > B. Measuring selinux constructs:
> >      We propose to add an IMA hook in enforcing_set() present under
> >      security/selinux/include/security.h.
> >      enforcing_set() sets the selinux state to enforcing/permissive etc.
> >      and is called from key places like selinux_init(),
> >      sel_write_enforce() etc.
> >      The hook will measure various attributes related to selinux status.
> >      Majority of the attributes are present in the struct selinux_state
> >      present in security/selinux/include/security.h
> >      e.g.
> >      $sestatus
> >             SELinux status:              enabled
> >             SELinuxfs mount:             /sys/fs/selinux
> >             SELinux root directory:      /etc/selinux
> >             Loaded policy name:          default
> >             Current mode:                permissive
> >             Mode from config file:       permissive
> >             Policy MLS status:           enabled
> >             Policy deny_unknown status:  allowed
> >             Memory protection checking:  requested (insecure)
> >             Max kernel policy version:   32
> >
> >      The above attributes will be serialized into a set of key=value
> >      pairs when passed to IMA for measurement.
> >
> >      Proposed Function Signature of the IMA hook:
> >      void ima_selinux_status(void *selinux_status, int len);
>
> This won't detect changes to any of these state variables via a kernel
> write vulnerability,
> so it would be good to provide a way to trigger measurement of the
> current values on
> demand.
> You'll also likely want to measure parts of the child structures of
> selinux_state, e.g. selinux_ss,
> especially selinux_map and policydb.  You can simplify measurement of
> the policydb by
> serializing it first via policydb_write() and hashing the result. I
> suppose one question is whether you can do all of this
> already from userspace by just having userspace read
> /sys/fs/selinux/enforce, /sys/fs/selinux/policy, etc.

It sees to me that  LKRG (kernel run time guard)  takes the role of
measuring kernel structures.  Perhaps you need to consult with LKRG
guys.
Lev.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

