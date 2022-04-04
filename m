Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 991F84F1A25
	for <lists+dm-devel@lfdr.de>; Mon,  4 Apr 2022 22:25:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649103918;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6JMPCn34aHVBHTYU+y9/ja4w9XJxew2Ukl5j0ipUMYk=;
	b=Y2tlbvC5E4xiaCauzBvViQCxhXRBGxaZv/WNWTkT5NL8csKgMDTICU28bgPc41nrprfMNl
	DokggSN1S86e7pE2ut7bNYz23lrL+RUrJ02lK8sg3H4BLE0ewV9v0OYLbm/BdNY0ak5uXr
	SjzhUFhdfRjkgXKROfnNbXbSKP94Bog=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-gJMiiMNBPNGR276VR6YLhw-1; Mon, 04 Apr 2022 16:25:15 -0400
X-MC-Unique: gJMiiMNBPNGR276VR6YLhw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED2D58002BF;
	Mon,  4 Apr 2022 20:25:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B71641047E7;
	Mon,  4 Apr 2022 20:25:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 225C61940376;
	Mon,  4 Apr 2022 20:25:10 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7BF819451EF
 for <dm-devel@listman.corp.redhat.com>; Mon,  4 Apr 2022 20:25:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8816D41047E8; Mon,  4 Apr 2022 20:25:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7031541047E7;
 Mon,  4 Apr 2022 20:25:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 234KP7w8032016;
 Mon, 4 Apr 2022 15:25:07 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 234KP6Vw032015;
 Mon, 4 Apr 2022 15:25:06 -0500
Date: Mon, 4 Apr 2022 15:25:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20220404202506.GZ24684@octiron.msp.redhat.com>
References: <20220404170457.16021-1-mwilck@suse.com>
 <20220404170457.16021-6-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20220404170457.16021-6-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH v2 05/15] multipathd: reconfigure: disallow
 changing uid_attrs
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

 On Mon, Apr 04, 2022 at 07:04:47PM +0200, mwilck@suse.com wrote:
> uevent merging by WWID relies on the uid_attrs config option. As we
> drop struct config between calls to uevent_merge(), we must be sure
> that the WWID is not changed in reconfigure().
> 
> Signed-off-by: Martin Wilck <mwilck@suse.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  multipath/multipath.conf.5 |  2 ++
>  multipathd/main.c          | 59 ++++++++++++++++++++++++++++++++------
>  2 files changed, 52 insertions(+), 9 deletions(-)
> 
> diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> index 605b46e..a9cd776 100644
> --- a/multipath/multipath.conf.5
> +++ b/multipath/multipath.conf.5
> @@ -264,6 +264,8 @@ If this option is configured and matches the device
>  node name of a device, it overrides any other configured  methods for
>  determining the WWID for this device.
>  .PP
> +This option cannot be changed during runtime with the multipathd \fBreconfigure\fR command.
> +.PP
>  The default is: \fB<unset>\fR. To enable uevent merging, set it e.g. to
>  \(dqsd:ID_SERIAL dasd:ID_UID nvme:ID_WWN\(dq.
>  .RE
> diff --git a/multipathd/main.c b/multipathd/main.c
> index 13b1948..6808ad1 100644
> --- a/multipathd/main.c
> +++ b/multipathd/main.c
> @@ -2835,11 +2835,58 @@ void rcu_free_config(struct rcu_head *head)
>  	free_config(conf);
>  }
>  
> +static bool reconfigure_check_uid_attrs(const struct _vector *old_attrs,
> +					const struct _vector *new_attrs)
> +{
> +	int i;
> +	char *old;
> +
> +	if (VECTOR_SIZE(old_attrs) != VECTOR_SIZE(new_attrs))
> +		return true;
> +
> +	vector_foreach_slot(old_attrs, old, i) {
> +		char *new = VECTOR_SLOT(new_attrs, i);
> +
> +		if (strcmp(old, new))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void reconfigure_check(struct config *old, struct config *new)
> +{
> +	int old_marginal_pathgroups;
> +
> +	old_marginal_pathgroups = old->marginal_pathgroups;
> +	if ((old_marginal_pathgroups == MARGINAL_PATHGROUP_FPIN) !=
> +	    (new->marginal_pathgroups == MARGINAL_PATHGROUP_FPIN)) {
> +		condlog(1, "multipathd must be restarted to turn %s fpin marginal paths",
> +			(old_marginal_pathgroups == MARGINAL_PATHGROUP_FPIN)?
> +			"off" : "on");
> +		new->marginal_pathgroups = old_marginal_pathgroups;
> +	}
> +
> +	if (reconfigure_check_uid_attrs(&old->uid_attrs, &new->uid_attrs)) {
> +		int i;
> +		void *ptr;
> +
> +		condlog(1, "multipathd must be restarted to change uid_attrs, keeping old values");
> +		vector_foreach_slot(&new->uid_attrs, ptr, i)
> +			free(ptr);
> +		vector_reset(&new->uid_attrs);
> +		new->uid_attrs = old->uid_attrs;
> +
> +		/* avoid uid_attrs being freed in rcu_free_config() */
> +		old->uid_attrs.allocated = 0;
> +		old->uid_attrs.slot = NULL;
> +	}
> +}
> +
>  static int
>  reconfigure (struct vectors *vecs, enum force_reload_types reload_type)
>  {
>  	struct config * old, *conf;
> -	int old_marginal_pathgroups;
>  
>  	conf = load_config(DEFAULT_CONFIGFILE);
>  	if (!conf)
> @@ -2870,14 +2917,8 @@ reconfigure (struct vectors *vecs, enum force_reload_types reload_type)
>  	uxsock_timeout = conf->uxsock_timeout;
>  
>  	old = rcu_dereference(multipath_conf);
> -	old_marginal_pathgroups = old->marginal_pathgroups;
> -	if ((old_marginal_pathgroups == MARGINAL_PATHGROUP_FPIN) !=
> -	    (conf->marginal_pathgroups == MARGINAL_PATHGROUP_FPIN)) {
> -		condlog(1, "multipathd must be restarted to turn %s fpin marginal paths",
> -			(old_marginal_pathgroups == MARGINAL_PATHGROUP_FPIN)?
> -			"off" : "on");
> -		conf->marginal_pathgroups = old_marginal_pathgroups;
> -	}
> +	reconfigure_check(old, conf);
> +
>  	conf->sequence_nr = old->sequence_nr + 1;
>  	rcu_assign_pointer(multipath_conf, conf);
>  	call_rcu(&old->rcu, rcu_free_config);
> -- 
> 2.35.1
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

