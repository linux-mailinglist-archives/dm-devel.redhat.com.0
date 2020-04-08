Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 721F01A2347
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 15:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586353520;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Tz7SkGBU4PI32xRn/CI/8mBAJoA+dX04IV8rw/da8sU=;
	b=Sw49I6BEaFr+CuBa7hTjTtKeVNc2t5Xru8bH3WJcZkv0eOq7/5TpRnESi3lSNdmDcBSuek
	u0Bc+wdhmQHiP72hpz8YTNF9xwgrzC6NsrnzVbkqw6WzQPa9eNQOHJSNMow7Pv682JlSbq
	Q/VSfLUhXY5QxQHthiWQL6oD7hDgSgs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-LctQarc-PfCkBGThNnLlug-1; Wed, 08 Apr 2020 09:45:12 -0400
X-MC-Unique: LctQarc-PfCkBGThNnLlug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BCF1107B113;
	Wed,  8 Apr 2020 13:45:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B3C938D;
	Wed,  8 Apr 2020 13:45:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4030B18089CD;
	Wed,  8 Apr 2020 13:45:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 038AR8UT028988 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Apr 2020 06:27:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98F3E107CD14; Wed,  8 Apr 2020 10:27:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CBA2107CD16
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 10:27:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8CF78FF66C
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 10:27:05 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-129-izU-ci5eOBab7_DIBfLuHA-1;
	Wed, 08 Apr 2020 06:27:03 -0400
X-MC-Unique: izU-ci5eOBab7_DIBfLuHA-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id 752B420B4737;
	Wed,  8 Apr 2020 03:19:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 752B420B4737
To: linux-integrity@vger.kernel.org, zohar@linux.ibm.com,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	dm-devel@redhat.com
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <f92bef0f-eb40-0e07-540c-321134e4b070@linux.microsoft.com>
Date: Wed, 8 Apr 2020 03:19:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 038AR8UT028988
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 08 Apr 2020 09:37:20 -0400
Cc: sashal@kernel.org, nramas@linux.microsoft.com, jmorris@namei.org,
	chpebeni@linux.microsoft.com, suredd@microsoft.com, balajib@microsoft.com
Subject: [dm-devel] [RFC] IMA: New IMA measurements for dm-crypt and selinux
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

The goals of the kernel integrity subsystem are to detect if files have
been accidentally or maliciously altered, both remotely and locally,
appraise a file's measurement against a "good" value stored as an
extended attribute, and enforce local file integrity [1].

To achieve these goals, IMA subsystem measures several in-memory
constructs and files.

We propose to measure constructs in dm-crypt and selinux to further
enhance measuring capabilities of IMA.

If there is existing or planned work to measure dm-crypt and selinux
constructs, we would like to contribute to that.

dm-crypt is a subsystem used for encryption of the block device, which
is essential for ensuring protection of data and secrets at rest.

Measuring encryption status of the device will ensure the device is not
maliciously reporting false encryption status - thus, it can be
entrusted with sensitive data to be protected at rest.

SELinux is an implementation of mandatory access controls (MAC) on
Linux. Mandatory access controls allow an administrator of a system to
define how applications and users can access different resources - such
as files, devices, networks and inter-process communication. With
SELinux an administrator can differentiate a user from the applications
a user runs [2].

Measuring SELinux status and various SELinux policies can help ensure
mandatory access control of the system is not compromised.

Proposal:
---------
A. Measuring dmcrypt constructs:
     We can add an IMA hook in crypt_ctr() present in
     drivers/md/dm-crypt.c, so that IMA can start measuring the status of
     various dm-crypt targets (represented by crypt_target struct - also
     defined in dm-crypt.c).
     The mapping table[3] has information of devices being encrypted
     (start sector, size, target name, cypher, key, device path, and
     other optional parameters.)
     e.g.
     0 417792 crypt serpent-cbc-essiv:sha256
     a7f67ad520bd83b9725df6ebd76c3eee 0 /dev/sdb 0 1 allow_discards

     We can pass various attributes of mapping table to IMA through a key
     value pair of various dmcrypt constructs.

     Proposed Function Signature of the IMA hook:
     void ima_dmcrypt_status(void *dmcrypt_status, int len);

B. Measuring selinux constructs:
     We propose to add an IMA hook in enforcing_set() present under
     security/selinux/include/security.h.
     enforcing_set() sets the selinux state to enforcing/permissive etc.
     and is called from key places like selinux_init(),
     sel_write_enforce() etc.
     The hook will measure various attributes related to selinux status.
     Majority of the attributes are present in the struct selinux_state
     present in security/selinux/include/security.h
     e.g.
     $sestatus
            SELinux status:              enabled
            SELinuxfs mount:             /sys/fs/selinux
            SELinux root directory:      /etc/selinux
            Loaded policy name:          default
            Current mode:                permissive
            Mode from config file:       permissive
            Policy MLS status:           enabled
            Policy deny_unknown status:  allowed
            Memory protection checking:  requested (insecure)
            Max kernel policy version:   32

     The above attributes will be serialized into a set of key=value
     pairs when passed to IMA for measurement.

     Proposed Function Signature of the IMA hook:
     void ima_selinux_status(void *selinux_status, int len);

Please provide comments\feedback on the proposal.

Thanks,
Tushar

[1] https://sourceforge.net/p/linux-ima/wiki/Home/
[2] https://selinuxproject.org/page/FAQ
[3] https://gitlab.com/cryptsetup/cryptsetup/wikis/DMCrypt


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

