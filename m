Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AAA1A2F551E
	for <lists+dm-devel@lfdr.de>; Thu, 14 Jan 2021 00:11:39 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-1bTin1NHMdO-nyQlmgbLIQ-1; Wed, 13 Jan 2021 18:11:36 -0500
X-MC-Unique: 1bTin1NHMdO-nyQlmgbLIQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F9115720;
	Wed, 13 Jan 2021 23:11:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 987FE60C47;
	Wed, 13 Jan 2021 23:11:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB340180954D;
	Wed, 13 Jan 2021 23:11:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10DNB4Zr004438 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 Jan 2021 18:11:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 251C02166B2A; Wed, 13 Jan 2021 23:11:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DF7F2166B2C
	for <dm-devel@redhat.com>; Wed, 13 Jan 2021 23:11:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20BC5101A53F
	for <dm-devel@redhat.com>; Wed, 13 Jan 2021 23:11:02 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-557-hC4qTLQ6ORGoscfUp9qpJA-1; Wed, 13 Jan 2021 18:11:00 -0500
X-MC-Unique: hC4qTLQ6ORGoscfUp9qpJA-1
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	10DMVhr8060376; Wed, 13 Jan 2021 18:10:59 -0500
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 36296wsmc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 13 Jan 2021 18:10:59 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10DMvi9Z140702;
	Wed, 13 Jan 2021 18:10:58 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
	[169.51.49.102])
	by mx0b-001b2d01.pphosted.com with ESMTP id 36296wsmbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 13 Jan 2021 18:10:58 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id
	10DN8Aea029585; Wed, 13 Jan 2021 23:10:56 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
	(b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 35ydrdd9qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 13 Jan 2021 23:10:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id 10DNAnMM26214902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 13 Jan 2021 23:10:49 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 950675204E;
	Wed, 13 Jan 2021 23:10:54 +0000 (GMT)
Received: from li-f45666cc-3089-11b2-a85c-c57d1a57929f.ibm.com (unknown
	[9.160.57.196])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 46DF752050;
	Wed, 13 Jan 2021 23:10:51 +0000 (GMT)
Message-ID: <e29a618645b0e73ec06960a02b6da465614689ff.camel@linux.ibm.com>
From: Mimi Zohar <zohar@linux.ibm.com>
To: Paul Moore <paul@paul-moore.com>
Date: Wed, 13 Jan 2021 18:10:50 -0500
In-Reply-To: <CAHC9VhRhYWEcK7TepZ=LK1m=9Zn_gtOZyAYfamP-TFU3rRH+zw@mail.gmail.com>
References: <20210108040708.8389-1-tusharsu@linux.microsoft.com>
	<20210108040708.8389-9-tusharsu@linux.microsoft.com>
	<CAHC9VhSJk0wG=WzO3bwsueiy19mMi9m6MamTrQfH8C=gXUtvGw@mail.gmail.com>
	<97328fc71687a0e1c327f6821548be9ba35bb193.camel@linux.ibm.com>
	<CAHC9VhTzaQ_q8gJ0oeok_yJ54XLETNvOuhhKnyRwgqsqvpBLCw@mail.gmail.com>
	<71cddb6c8676ccd63c89364d805cfca76d32cb6e.camel@linux.ibm.com>
	<CAHC9VhRhYWEcK7TepZ=LK1m=9Zn_gtOZyAYfamP-TFU3rRH+zw@mail.gmail.com>
Mime-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
	definitions=2021-01-13_12:2021-01-13,
	2021-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	malwarescore=0 clxscore=1015
	spamscore=0 mlxlogscore=999 adultscore=0 phishscore=0 bulkscore=0
	suspectscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
	priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
	engine=8.12.0-2009150000 definitions=main-2101130131
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
Cc: sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	nramas@linux.microsoft.com, selinux@vger.kernel.org,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
	casey@schaufler-ca.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v10 8/8] selinux: include a consumer of the
 new IMA critical data hook
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2021-01-13 at 17:10 -0500, Paul Moore wrote:
> On Wed, Jan 13, 2021 at 4:11 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
> > On Wed, 2021-01-13 at 14:19 -0500, Paul Moore wrote:
> > > On Wed, Jan 13, 2021 at 2:13 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
> > > > On Tue, 2021-01-12 at 11:27 -0500, Paul Moore wrote:
> > > > > On Thu, Jan 7, 2021 at 11:07 PM Tushar Sugandhi
> > > > > <tusharsu@linux.microsoft.com> wrote:
> > > > > > From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> > > > > >
> > > > > > SELinux stores the active policy in memory, so the changes to this data
> > > > > > at runtime would have an impact on the security guarantees provided
> > > > > > by SELinux.  Measuring in-memory SELinux policy through IMA subsystem
> > > > > > provides a secure way for the attestation service to remotely validate
> > > > > > the policy contents at runtime.
> > > > > >
> > > > > > Measure the hash of the loaded policy by calling the IMA hook
> > > > > > ima_measure_critical_data().  Since the size of the loaded policy
> > > > > > can be large (several MB), measure the hash of the policy instead of
> > > > > > the entire policy to avoid bloating the IMA log entry.
> > > > > >
> > > > > > To enable SELinux data measurement, the following steps are required:
> > > > > >
> > > > > > 1, Add "ima_policy=critical_data" to the kernel command line arguments
> > > > > >    to enable measuring SELinux data at boot time.
> > > > > > For example,
> > > > > >   BOOT_IMAGE=/boot/vmlinuz-5.10.0-rc1+ root=UUID=fd643309-a5d2-4ed3-b10d-3c579a5fab2f ro nomodeset security=selinux ima_policy=critical_data
> > > > > >
> > > > > > 2, Add the following rule to /etc/ima/ima-policy
> > > > > >    measure func=CRITICAL_DATA label=selinux
> > > > > >
> > > > > > Sample measurement of the hash of SELinux policy:
> > > > > >
> > > > > > To verify the measured data with the current SELinux policy run
> > > > > > the following commands and verify the output hash values match.
> > > > > >
> > > > > >   sha256sum /sys/fs/selinux/policy | cut -d' ' -f 1
> > > > > >
> > > > > >   grep "selinux-policy-hash" /sys/kernel/security/integrity/ima/ascii_runtime_measurements | tail -1 | cut -d' ' -f 6
> > > > > >
> > > > > > Note that the actual verification of SELinux policy would require loading
> > > > > > the expected policy into an identical kernel on a pristine/known-safe
> > > > > > system and run the sha256sum /sys/kernel/selinux/policy there to get
> > > > > > the expected hash.
> > > > > >
> > > > > > Signed-off-by: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> > > > > > Suggested-by: Stephen Smalley <stephen.smalley.work@gmail.com>
> > > > > > Reviewed-by: Tyler Hicks <tyhicks@linux.microsoft.com>
> > > > > > ---
> > > > > >  Documentation/ABI/testing/ima_policy |  3 +-
> > > > > >  security/selinux/Makefile            |  2 +
> > > > > >  security/selinux/ima.c               | 64 ++++++++++++++++++++++++++++
> > > > > >  security/selinux/include/ima.h       | 24 +++++++++++
> > > > > >  security/selinux/include/security.h  |  3 +-
> > > > > >  security/selinux/ss/services.c       | 64 ++++++++++++++++++++++++----
> > > > > >  6 files changed, 149 insertions(+), 11 deletions(-)
> > > > > >  create mode 100644 security/selinux/ima.c
> > > > > >  create mode 100644 security/selinux/include/ima.h
> > > > >
> > > > > I remain concerned about the possibility of bypassing a measurement by
> > > > > tampering with the time, but I appear to be the only one who is
> > > > > worried about this so I'm not going to block this patch on those
> > > > > grounds.
> > > > >
> > > > > Acked-by: Paul Moore <paul@paul-moore.com>
> > > >
> > > > Thanks, Paul.
> > > >
> > > > Including any unique string would cause the buffer hash to change,
> > > > forcing a new measurement.  Perhaps they were concerned with
> > > > overflowing a counter.
> > >
> > > My understanding is that Lakshmi wanted to force a new measurement
> > > each time and felt using a timestamp would be the best way to do that.
> > > A counter, even if it wraps, would have a different value each time
> > > whereas a timestamp is vulnerable to time adjustments.  While a
> > > properly controlled and audited system could be configured and
> > > monitored to detect such an event (I *think*), why rely on that if it
> > > isn't necessary?
> >
> > Why are you saying that even if the counter wraps a new measurement is
> > guaranteed.   I agree with the rest of what you said.
> 
> I was assuming that the IMA code simply compares the passed
> "policy_event_name" value to the previous value, if they are different
> a new measurement is taken, if they are the same the measurement
> request is ignored.  If this is the case the counter value is only
> important in as much as that it is different from the previous value,
> even simply toggling a single bit back and forth would suffice in this
> case.  IMA doesn't keep a record of every previous "policy_event_name"
> value does it?  Am I misunderstanding how
> ima_measure_critical_data(...) works?

Originally, there was quite a bit of discussion as to how much or how
little should be measured for a number of reasons.  One reason is that
the TPM is relatively slow.  Another reason is to limit the size of the
measurement list.  For this reason, duplicate hashes aren't added to
the measurement list or extended into the TPM.

When a dentry is removed from cache, its also removed from IMA's iint
cache.  A subsequent file read would result in adding the measurement
and extending the TPM again.  ima_lookup_digest_entry() is called to
prevent adding the duplicate entry. 

Lakshmi is trying to address the situation where an event changes a
value, but then is restored to the original value.  The original and
subsequent events are measured, but restoring to the original value
isn't re-measured.  This isn't any different than when a file is
modified and then reverted.

Instead of changing the name like this, which doesn't work for files,
allowing duplicate measurements should be generic, based on policy.

Mimi

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

