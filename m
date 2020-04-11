Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D99EC1A73B3
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586845790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vgb6+wgphxTI8xWwRvrOZ53B9FAqcXTOyMPt0WYmqTg=;
	b=QM+0NbixjKaBBlqLy3hVpcLsOwSnDmJEiHH3fzVl3JBnRsVbkh4y+UERhdm9xV4+zZo8T0
	E4yrA4PaztED7ee5zTKCN2KyzngQ57skcszOGlznsCHKIZECjoWrsF7neSZN6D2ZUPB/DJ
	IVT64unjOQ6/NH86x4UgGhVuS3Kvmp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-fITR9HXZMpaU8N0r1hqPHg-1; Tue, 14 Apr 2020 02:29:47 -0400
X-MC-Unique: fITR9HXZMpaU8N0r1hqPHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38D3B1007282;
	Tue, 14 Apr 2020 06:29:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 116725C1B5;
	Tue, 14 Apr 2020 06:29:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D17518089CE;
	Tue, 14 Apr 2020 06:29:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03BJ5oeo020438 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 11 Apr 2020 15:05:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 505F6AF79A; Sat, 11 Apr 2020 19:05:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43C8EAF799
	for <dm-devel@redhat.com>; Sat, 11 Apr 2020 19:05:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C44098FF67D
	for <dm-devel@redhat.com>; Sat, 11 Apr 2020 19:05:47 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-66-Ni7y4Ww_MDOuAibxykj7_A-1; Sat, 11 Apr 2020 15:05:21 -0400
X-MC-Unique: Ni7y4Ww_MDOuAibxykj7_A-1
Received: by mail-wr1-f67.google.com with SMTP id c15so5821125wro.11
	for <dm-devel@redhat.com>; Sat, 11 Apr 2020 12:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JJ7hnNFhk/mxUWoU/yAmjq9znKBHBG2b6AkM8126D5U=;
	b=VMzlBW41PXJ3vNcdiXOLU4dZBPUwTgbOB/g+HBT6C74+g+kUug9lxOoyLImjGxjJxW
	1XfKupahXvtjWgcz3YkA8F8HNLiNRo61DsHaDj2r8G/DMpnCGsD25rTLgTrhttJqr6XQ
	afXRFyZXSACjSK8VP7/DfZwkfu7gZLMfeSstwKQwv1g+nLT47onYNSmS013Kqnnbaz7q
	C9azDy3UdLRti8109UqMWFIHn4TOWGsGlfGDEuyRDgwQ1VI+lMIs2z26WUQNIkI/uVxy
	eSYG84+FnWNApxGu50+itnpY3ciJXb9Mi+nf/8jC4j89puhdjgiOtSUSfTVefq+JJ8uF
	Xc+g==
X-Gm-Message-State: AGi0PuafT4tHtq3JS6uBwmp6DvPSdZYjKirkOx3mIzLZuDpCRGsiZcV2
	CIAtrHg0Jgjniqd3AVVEtJEKEwMLaTY9yGM7km8=
X-Google-Smtp-Source: APiQypJfCKuBECqeq8oDEtF/Z00WuOl3uUYTl8M4KrnDNnIXPvozYKdyuDjc253Vbg821RFqmPypKE6hVppwiaGCPwU=
X-Received: by 2002:a5d:4111:: with SMTP id l17mr11678394wrp.271.1586631919839;
	Sat, 11 Apr 2020 12:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
In-Reply-To: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
From: Stephen Smalley <stephen.smalley@gmail.com>
Date: Sat, 11 Apr 2020 15:05:07 -0400
Message-ID: <CAB9W1A1=JyOV3-+6jn3xX-M+GKWBB2cCNh-VWB_kzf+YiR_d2Q@mail.gmail.com>
To: Tushar Sugandhi <tusharsu@linux.microsoft.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03BJ5oeo020438
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 02:29:25 -0400
Cc: sashal@kernel.org, nramas@linux.microsoft.com,
	SELinux <selinux@vger.kernel.org>,
	LSM List <linux-security-module@vger.kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	James Morris <jmorris@namei.org>, chpebeni@linux.microsoft.com,
	dm-devel@redhat.com, suredd@microsoft.com,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 8, 2020 at 6:28 AM Tushar Sugandhi
<tusharsu@linux.microsoft.com> wrote:
> Measuring SELinux status and various SELinux policies can help ensure
> mandatory access control of the system is not compromised.
<snip>
> B. Measuring selinux constructs:
>      We propose to add an IMA hook in enforcing_set() present under
>      security/selinux/include/security.h.
>      enforcing_set() sets the selinux state to enforcing/permissive etc.
>      and is called from key places like selinux_init(),
>      sel_write_enforce() etc.
>      The hook will measure various attributes related to selinux status.
>      Majority of the attributes are present in the struct selinux_state
>      present in security/selinux/include/security.h
>      e.g.
>      $sestatus
>             SELinux status:              enabled
>             SELinuxfs mount:             /sys/fs/selinux
>             SELinux root directory:      /etc/selinux
>             Loaded policy name:          default
>             Current mode:                permissive
>             Mode from config file:       permissive
>             Policy MLS status:           enabled
>             Policy deny_unknown status:  allowed
>             Memory protection checking:  requested (insecure)
>             Max kernel policy version:   32
>
>      The above attributes will be serialized into a set of key=value
>      pairs when passed to IMA for measurement.
>
>      Proposed Function Signature of the IMA hook:
>      void ima_selinux_status(void *selinux_status, int len);

This won't detect changes to any of these state variables via a kernel
write vulnerability,
so it would be good to provide a way to trigger measurement of the
current values on
demand.
You'll also likely want to measure parts of the child structures of
selinux_state, e.g. selinux_ss,
especially selinux_map and policydb.  You can simplify measurement of
the policydb by
serializing it first via policydb_write() and hashing the result. I
suppose one question is whether you can do all of this
already from userspace by just having userspace read
/sys/fs/selinux/enforce, /sys/fs/selinux/policy, etc.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

